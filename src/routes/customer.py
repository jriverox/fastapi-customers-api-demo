from fastapi import APIRouter, HTTPException
from typing import List
from ..models.customer import Customer
from ..schemas.customer import CustomerCreate, CustomerUpdate, CustomerResponse
from ..repositories.customer import CustomerRepository

router = APIRouter()
repository = CustomerRepository()

@router.get("/", response_model=List[CustomerResponse])
async def get_customers(skip: int = 0, limit: int = 10):
    customers = repository.get_customers(skip=skip, limit=limit)
    return customers

@router.get("/{customer_id}", response_model=CustomerResponse)
async def get_customer(customer_id: str):
    customer = repository.get_customer_by_id(customer_id)
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    return customer

@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(customer: CustomerCreate):
    # Generate new ID
    customers = repository.get_customers(skip=0, limit=1000)  # Get all customers to find max ID
    max_id = max(int(customer.id) for customer in customers) if customers else 0
    new_id = str(max_id + 1)
    
    # Convert CustomerCreate to Customer
    new_customer = Customer(
        id=new_id,
        first_name=customer.first_name,
        last_name=customer.last_name,
        brithday=customer.brithday,
        document_id=customer.document_id,
        phone_number=customer.phone_number,
        email=customer.email,
        address=customer.address,
        city=customer.city,
        state=customer.state,
        zip_code=customer.zip_code,
        country=customer.country
    )
    
    created_customer = repository.create_customer(new_customer)
    return created_customer

@router.put("/{customer_id}", response_model=CustomerResponse)
async def update_customer(customer_id: str, customer_update: CustomerUpdate):
    existing_customer = repository.get_customer_by_id(customer_id)
    if not existing_customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    
    # Update only the provided fields
    update_data = customer_update.model_dump(exclude_unset=True)
    for field, value in update_data.items():
        setattr(existing_customer, field, value)
    
    updated_customer = repository.update_customer(customer_id, existing_customer)
    if not updated_customer:
        raise HTTPException(status_code=500, detail="Failed to update customer")
    
    return updated_customer 