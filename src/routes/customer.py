import logging
from typing import List

from fastapi import APIRouter, Depends, Header, HTTPException
from opentelemetry import trace
from opentelemetry.trace import StatusCode
from sqlalchemy.ext.asyncio import AsyncSession

from ..database import get_db
from ..models.customer import Customer
from ..repositories.customer_repository import CustomerRepository
from ..schemas.customer import CustomerCreate, CustomerResponse, CustomerUpdate

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)
router = APIRouter()


def get_workspace_id(x_workspace_id: str = Header(..., alias="X-Workspace-ID")) -> str:
    return x_workspace_id


def get_repository(
    db: AsyncSession = Depends(get_db),
    workspace_id: str = Depends(get_workspace_id),
) -> CustomerRepository:
    return CustomerRepository(db, workspace_id=workspace_id)


def _enrich_customer_span(workspace_id: str, **attributes: str) -> trace.Span:
    span = trace.get_current_span()
    span.set_attribute("workspace.id", str(workspace_id))
    for key, value in attributes.items():
        span.set_attribute(key, str(value))
    return span


@router.get("/", response_model=List[CustomerResponse])
async def get_customers(
    skip: int = 0,
    limit: int = 10,
    workspace_id: str = Depends(get_workspace_id),
    repository: CustomerRepository = Depends(get_repository),
):
    span = _enrich_customer_span(workspace_id, **{"action.type": "list"})
    logger.info(
        "customers_list_started",
        extra={
            "workspace_id": str(workspace_id),
            "skip": skip,
            "limit": limit,
        },
    )
    try:
        customers = await repository.get_customers(skip=skip, limit=limit)
        span.set_attribute("customers.count", str(len(customers)))
        span.set_attribute("status", "success")
        logger.info(
            "customers_list_completed",
            extra={
                "workspace_id": str(workspace_id),
                "customer_count": len(customers),
            },
        )
        return customers
    except Exception as e:
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        raise


@router.get("/{customer_id}", response_model=CustomerResponse)
async def get_customer(
    customer_id: str,
    workspace_id: str = Depends(get_workspace_id),
    repository: CustomerRepository = Depends(get_repository),
):
    span = _enrich_customer_span(
        workspace_id,
        **{"customer.id": customer_id, "action.type": "get"},
    )
    logger.info(
        "customer_get_started",
        extra={
            "workspace_id": str(workspace_id),
            "customer_id": customer_id,
        },
    )
    try:
        customer = await repository.get_customer_by_id(customer_id)
        if not customer:
            span.set_attribute("status", "failure")
            logger.warning(
                "customer_not_found",
                extra={
                    "workspace_id": str(workspace_id),
                    "customer_id": customer_id,
                },
            )
            raise HTTPException(status_code=404, detail="Customer not found")
        span.set_attribute("status", "success")
        logger.info(
            "customer_get_completed",
            extra={
                "workspace_id": str(workspace_id),
                "customer_id": customer_id,
            },
        )
        return customer
    except HTTPException:
        raise
    except Exception as e:
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        raise


@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(
    customer: CustomerCreate,
    workspace_id: str = Depends(get_workspace_id),
    repository: CustomerRepository = Depends(get_repository),
):
    span = _enrich_customer_span(workspace_id, **{"action.type": "create"})
    try:
        new_id = await repository.get_next_id()
        span.set_attribute("customer.id", str(new_id))
        logger.info(
            "customer_create_started",
            extra={
                "workspace_id": str(workspace_id),
                "customer_id": new_id,
            },
        )
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
        created = await repository.create_customer(new_customer)
        span.set_attribute("status", "success")
        logger.info(
            "customer_create_completed",
            extra={
                "workspace_id": str(workspace_id),
                "customer_id": created.id,
            },
        )
        logger.info(
            "audit_event",
            extra={
                "workspace_id": str(workspace_id),
                "action": "create",
                "resource_type": "customer",
                "resource_id": created.id,
                "outcome": "success",
                "audit": True,
            },
        )
        return created
    except Exception as e:
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        raise


@router.put("/{customer_id}", response_model=CustomerResponse)
async def update_customer(
    customer_id: str,
    customer_update: CustomerUpdate,
    workspace_id: str = Depends(get_workspace_id),
    repository: CustomerRepository = Depends(get_repository),
):
    span = _enrich_customer_span(
        workspace_id,
        **{"customer.id": customer_id, "action.type": "update"},
    )
    logger.info(
        "customer_update_started",
        extra={
            "workspace_id": str(workspace_id),
            "customer_id": customer_id,
        },
    )
    try:
        existing_customer = await repository.get_customer_by_id(customer_id)
        if not existing_customer:
            span.set_attribute("status", "failure")
            logger.warning(
                "customer_not_found",
                extra={
                    "workspace_id": str(workspace_id),
                    "customer_id": customer_id,
                },
            )
            raise HTTPException(status_code=404, detail="Customer not found")

        update_data = customer_update.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            setattr(existing_customer, field, value)

        updated_customer = await repository.update_customer(customer_id, existing_customer)
        if not updated_customer:
            span.set_attribute("status", "failure")
            span.set_attribute("exception.type", "UpdateFailed")
            span.set_status(StatusCode.ERROR, "Failed to update customer")
            logger.error(
                "customer_update_failed",
                extra={
                    "workspace_id": str(workspace_id),
                    "customer_id": customer_id,
                },
                exc_info=True,
            )
            raise HTTPException(status_code=500, detail="Failed to update customer")

        span.set_attribute("status", "success")
        logger.info(
            "customer_update_completed",
            extra={
                "workspace_id": str(workspace_id),
                "customer_id": customer_id,
                "fields_updated": list(update_data.keys()),
            },
        )
        logger.info(
            "audit_event",
            extra={
                "workspace_id": str(workspace_id),
                "action": "update",
                "resource_type": "customer",
                "resource_id": customer_id,
                "outcome": "success",
                "audit": True,
            },
        )
        return updated_customer
    except HTTPException:
        raise
    except Exception as e:
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        raise
