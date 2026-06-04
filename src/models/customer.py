from datetime import date

from sqlalchemy import Date, String
from sqlalchemy.orm import Mapped, mapped_column

from ..database import Base


class Customer(Base):
    __tablename__ = "customers"

    id: Mapped[str] = mapped_column(String, primary_key=True)
    first_name: Mapped[str] = mapped_column(String)
    last_name: Mapped[str] = mapped_column(String)
    birthday: Mapped[date] = mapped_column(Date)
    document_id: Mapped[str] = mapped_column(String)
    phone_number: Mapped[str] = mapped_column(String)
    email: Mapped[str] = mapped_column(String)
    address: Mapped[str] = mapped_column(String)
    city: Mapped[str] = mapped_column(String)
    state: Mapped[str] = mapped_column(String)
    zip_code: Mapped[str] = mapped_column(String)
    country: Mapped[str] = mapped_column(String)
