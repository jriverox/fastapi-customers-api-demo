from pydantic import BaseModel, Field
from typing import Optional


class CustomerBase(BaseModel):
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

class CustomerCreate(CustomerBase):
    pass

class CustomerUpdate(CustomerBase):
    first_name: Optional[str] = None
    last_name: Optional[str] = None
    brithday: Optional[str] = None
    document_id: Optional[str] = None
    phone_number: Optional[str] = None
    email: Optional[str] = None
    address: Optional[str] = None
    city: Optional[str] = None
    state: Optional[str] = None
    zip_code: Optional[str] = None
    country: Optional[str] = None


class CustomerResponse(CustomerBase):
    id: str

    class Config:
        from_attributes = True 