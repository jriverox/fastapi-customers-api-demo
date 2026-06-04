import logging
from typing import List, Optional

from sqlalchemy import cast, func, select
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.types import Integer

from ..models.customer import Customer

logger = logging.getLogger(__name__)


class CustomerRepository:
    def __init__(self, db: AsyncSession, workspace_id: str = "unknown"):
        self.db = db
        self.workspace_id = workspace_id

    async def get_customers(self, skip: int = 0, limit: int = 10) -> List[Customer]:
        try:
            result = await self.db.execute(select(Customer).offset(skip).limit(limit))
            return list(result.scalars().all())
        except Exception:
            logger.error(
                "customers_db_list_failed",
                extra={
                    "workspace_id": str(self.workspace_id),
                    "skip": skip,
                    "limit": limit,
                },
                exc_info=True,
            )
            raise

    async def get_customer_by_id(self, customer_id: str) -> Optional[Customer]:
        try:
            result = await self.db.execute(select(Customer).where(Customer.id == customer_id))
            return result.scalar_one_or_none()
        except Exception:
            logger.error(
                "customer_db_get_failed",
                extra={
                    "workspace_id": str(self.workspace_id),
                    "customer_id": customer_id,
                },
                exc_info=True,
            )
            raise

    async def get_next_id(self) -> str:
        try:
            result = await self.db.execute(
                select(func.coalesce(func.max(cast(Customer.id, Integer)), 0))
            )
            return str(result.scalar_one() + 1)
        except Exception:
            logger.error(
                "customer_db_next_id_failed",
                extra={
                    "workspace_id": str(self.workspace_id),
                },
                exc_info=True,
            )
            raise

    async def create_customer(self, customer: Customer) -> Customer:
        try:
            self.db.add(customer)
            await self.db.commit()
            await self.db.refresh(customer)
            return customer
        except Exception:
            logger.error(
                "customer_db_create_failed",
                extra={
                    "workspace_id": str(self.workspace_id),
                    "customer_id": customer.id,
                },
                exc_info=True,
            )
            raise

    async def update_customer(self, customer_id: str, customer: Customer) -> Optional[Customer]:
        existing = await self.get_customer_by_id(customer_id)
        if not existing:
            return None

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
            return existing
        except Exception:
            logger.error(
                "customer_db_update_failed",
                extra={
                    "workspace_id": str(self.workspace_id),
                    "customer_id": customer_id,
                },
                exc_info=True,
            )
            raise
