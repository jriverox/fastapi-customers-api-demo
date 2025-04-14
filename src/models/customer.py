from dataclasses import dataclass
from typing import Optional

@dataclass
class Customer:
    id: str
    first_name: str
    last_name: str
    brithday: str
    document_id: str
    phone_number: str
    email: str
    address: str
    city: str
    state: str
    zip_code: str
    country: str
