from typing import List

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

from ..database import get_db
from ..models.customer import Customer
from ..repositories.customer_repository import CustomerRepository
from ..schemas.customer import CustomerCreate, CustomerResponse, CustomerUpdate

router = APIRouter()


def get_repository(db: AsyncSession = Depends(get_db)) -> CustomerRepository:
    return CustomerRepository(db)


@router.get("/", response_model=List[CustomerResponse])
async def get_customers(
    skip: int = 0,
    limit: int = 10,
    repository: CustomerRepository = Depends(get_repository),
):
    return await repository.get_customers(skip=skip, limit=limit)


@router.get("/{customer_id}", response_model=CustomerResponse)
async def get_customer(
    customer_id: str,
    repository: CustomerRepository = Depends(get_repository),
):
    customer = await repository.get_customer_by_id(customer_id)
    if not customer:
        raise HTTPException(status_code=404, detail="Customer not found")
    return customer


@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(
    customer: CustomerCreate,
    repository: CustomerRepository = Depends(get_repository),
):
    new_id = await repository.get_next_id()

    new_customer = Customer(
        id=new_id,
        first_name=customer.first_name,
        last_name=customer.last_name,
        birthday=customer.birthday,
        document_id=customer.document_id,
        phone_number=customer.phone_number,
        email=customer.email,
        address=customer.address,
        city=customer.city,
        state=customer.state,
        zip_code=customer.zip_code,
        country=customer.country,
    )

    return await repository.create_customer(new_customer)


@router.put("/{customer_id}", response_model=CustomerResponse)
async def update_customer(
    customer_id: str,
    customer_update: CustomerUpdate,
    repository: CustomerRepository = Depends(get_repository),
):
    existing_customer = await repository.get_customer_by_id(customer_id)
    if not existing_customer:
        raise HTTPException(status_code=404, detail="Customer not found")

    update_data = customer_update.model_dump(exclude_unset=True)
    for field, value in update_data.items():
        setattr(existing_customer, field, value)

    updated_customer = await repository.update_customer(customer_id, existing_customer)
    if not updated_customer:
        raise HTTPException(status_code=500, detail="Failed to update customer")

    return updated_customer
