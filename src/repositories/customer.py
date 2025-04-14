import json
import os
from typing import List, Optional
from ..models.customer import Customer

class CustomerRepository:
    def __init__(self):
        self.db_file = os.path.join(os.path.dirname(__file__), "customers_db.json")
        self._ensure_db_exists()
    
    def _ensure_db_exists(self):
        if not os.path.exists(self.db_file):
            with open(self.db_file, "w") as f:
                json.dump([], f, indent=2)

    def _load_customers(self) -> List[dict]:
        with open(self.db_file, "r") as f:
            return json.load(f)

    def _save_customers(self, customers: List[dict]):
        with open(self.db_file, "w") as f:
            json.dump(customers, f, indent=2)

    def get_customers(self, skip: int = 0, limit: int = 10) -> List[Customer]:
        customers_data = self._load_customers()
        paginated_customers = customers_data[skip:skip + limit]
        return [self._dict_to_customer(customer) for customer in paginated_customers]

    def get_customer_by_id(self, customer_id: str) -> Optional[Customer]:
        customers_data = self._load_customers()
        for customer_data in customers_data:
            if customer_data["id"] == customer_id:
                return self._dict_to_customer(customer_data)
        return None

    def create_customer(self, customer: Customer) -> Customer:
        customers_data = self._load_customers()
        customers_data.append(self._customer_to_dict(customer))
        self._save_customers(customers_data)
        return customer

    def update_customer(self, customer_id: str, customer: Customer) -> Optional[Customer]:
        customers_data = self._load_customers()
        for i, customer_data in enumerate(customers_data):
            if customer_data["id"] == customer_id:
                customers_data[i] = self._customer_to_dict(customer)
                self._save_customers(customers_data)
                return customer
        return None

    def _dict_to_customer(self, customer_dict: dict) -> Customer:
        return Customer(
            id=customer_dict["id"],
            first_name=customer_dict["first_name"],
            last_name=customer_dict["last_name"],
            brithday=customer_dict["brithday"],
            document_id=customer_dict["document_id"],
            phone_number=customer_dict["phone_number"],
            email=customer_dict["email"],
            address=customer_dict["address"],
            city=customer_dict["city"],
            state=customer_dict["state"],
            zip_code=customer_dict["zip_code"],
            country=customer_dict["country"]
        )

    def _customer_to_dict(self, customer: Customer) -> dict:
        return {
            "id": customer.id,
            "first_name": customer.first_name,
            "last_name": customer.last_name,
            "brithday": customer.brithday,
            "document_id": customer.document_id,
            "phone_number": customer.phone_number,
            "email": customer.email,
            "address": customer.address,
            "city": customer.city,
            "state": customer.state,
            "zip_code": customer.zip_code,
            "country": customer.country
        } 