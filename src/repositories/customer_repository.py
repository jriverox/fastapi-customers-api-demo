import logging
from typing import List, Optional

from opentelemetry import trace
from sqlalchemy import cast, func, select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.types import Integer

from ..models.customer import Customer

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)


class CustomerRepository:
    def __init__(self, db: AsyncSession):
        self.db = db

    async def get_customers(self, skip: int = 0, limit: int = 10) -> List[Customer]:
        result = await self.db.execute(select(Customer).offset(skip).limit(limit))
        return list(result.scalars().all())

    async def get_customer_by_id(self, customer_id: str) -> Optional[Customer]:
        result = await self.db.execute(select(Customer).where(Customer.id == customer_id))
        return result.scalar_one_or_none()

    async def get_next_id(self) -> str:
        result = await self.db.execute(
            select(func.coalesce(func.max(cast(Customer.id, Integer)), 0))
        )
        return str(result.scalar_one() + 1)

    async def create_customer(self, customer: Customer) -> Customer:
        logger.info("db_customer_create_started", extra={"customer_id": customer.id})
        try:
            self.db.add(customer)
            await self.db.commit()
            await self.db.refresh(customer)
            logger.info("db_customer_create_completed", extra={"customer_id": customer.id})
            return customer
        except Exception:
            logger.error("db_customer_create_failed", extra={"customer_id": customer.id}, exc_info=True)
            raise

    async def update_customer(self, customer_id: str, customer: Customer) -> Optional[Customer]:
        existing = await self.get_customer_by_id(customer_id)
        if not existing:
            return None

        logger.info("db_customer_update_started", extra={"customer_id": customer_id})
        try:
            for field in (
                "first_name",
                "last_name",
                "birthday",
                "document_id",
                "phone_number",
                "email",
                "address",
                "city",
                "state",
                "zip_code",
                "country",
            ):
                setattr(existing, field, getattr(customer, field))

            await self.db.commit()
            await self.db.refresh(existing)
            logger.info("db_customer_update_completed", extra={"customer_id": customer_id})
            return existing
        except Exception:
            logger.error("db_customer_update_failed", extra={"customer_id": customer_id}, exc_info=True)
            raise
