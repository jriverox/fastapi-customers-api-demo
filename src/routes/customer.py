import logging
import time
from typing import List

from fastapi import APIRouter, Depends, HTTPException
from opentelemetry import metrics as otel_metrics
from opentelemetry import trace
from opentelemetry.trace import StatusCode
from sqlalchemy.ext.asyncio import AsyncSession

from ..database import get_db
from ..models.customer import Customer
from ..repositories.customer_repository import CustomerRepository
from ..schemas.customer import CustomerCreate, CustomerResponse, CustomerUpdate

logger = logging.getLogger(__name__)
tracer = trace.get_tracer(__name__)

meter = otel_metrics.get_meter("customers")

customers_operations = meter.create_counter(
    name="customers.operations.total",
    description="Total de operaciones sobre clientes",
    unit="{operation}",
)
operation_duration = meter.create_histogram(
    name="customers.operation.duration",
    description="Duración de operaciones sobre clientes",
    unit="s",
)

router = APIRouter()


def get_repository(db: AsyncSession = Depends(get_db)) -> CustomerRepository:
    return CustomerRepository(db)


@router.get("/", response_model=List[CustomerResponse])
async def get_customers(
    skip: int = 0,
    limit: int = 10,
    repository: CustomerRepository = Depends(get_repository),
):
    span = trace.get_current_span()
    span.set_attribute("customers.skip", skip)
    span.set_attribute("customers.limit", limit)
    start = time.monotonic()
    logger.info("customers_list_started", extra={"skip": skip, "limit": limit})
    try:
        result = await repository.get_customers(skip=skip, limit=limit)
        elapsed = time.monotonic() - start
        span.set_attribute("customers.count", len(result))
        span.set_attribute("status", "success")
        customers_operations.add(1, {"operation": "list", "status": "success"})
        operation_duration.record(elapsed, {"operation": "list"})
        logger.info("customers_list_completed", extra={"count": len(result), "skip": skip, "limit": limit})
        return result
    except Exception as e:
        elapsed = time.monotonic() - start
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        customers_operations.add(1, {"operation": "list", "status": "failure"})
        operation_duration.record(elapsed, {"operation": "list"})
        logger.error("customers_list_failed", extra={"skip": skip, "limit": limit}, exc_info=True)
        raise


@router.get("/{customer_id}", response_model=CustomerResponse)
async def get_customer(
    customer_id: str,
    repository: CustomerRepository = Depends(get_repository),
):
    span = trace.get_current_span()
    span.set_attribute("customer.id", str(customer_id))
    start = time.monotonic()
    logger.info("customer_get_started", extra={"customer_id": customer_id})
    try:
        customer = await repository.get_customer_by_id(customer_id)
        elapsed = time.monotonic() - start
        if not customer:
            span.set_attribute("status", "not_found")
            customers_operations.add(1, {"operation": "get", "status": "not_found"})
            operation_duration.record(elapsed, {"operation": "get"})
            logger.warning("customer_not_found", extra={"customer_id": customer_id})
            raise HTTPException(status_code=404, detail="Customer not found")
        span.set_attribute("status", "success")
        customers_operations.add(1, {"operation": "get", "status": "success"})
        operation_duration.record(elapsed, {"operation": "get"})
        logger.info("customer_get_completed", extra={"customer_id": customer_id})
        return customer
    except HTTPException:
        raise
    except Exception as e:
        elapsed = time.monotonic() - start
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        customers_operations.add(1, {"operation": "get", "status": "failure"})
        operation_duration.record(elapsed, {"operation": "get"})
        logger.error("customer_get_failed", extra={"customer_id": customer_id}, exc_info=True)
        raise


@router.post("/", response_model=CustomerResponse, status_code=201)
async def create_customer(
    customer: CustomerCreate,
    repository: CustomerRepository = Depends(get_repository),
):
    span = trace.get_current_span()
    start = time.monotonic()
    logger.info("customer_create_started", extra={"customer_document": customer.document_id})
    try:
        new_id = await repository.get_next_id()
        span.set_attribute("customer.id", str(new_id))
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
        result = await repository.create_customer(new_customer)
        elapsed = time.monotonic() - start
        span.set_attribute("status", "success")
        customers_operations.add(1, {"operation": "create", "status": "success"})
        operation_duration.record(elapsed, {"operation": "create"})
        logger.info("customer_create_completed", extra={"customer_id": result.id})
        return result
    except Exception as e:
        elapsed = time.monotonic() - start
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        customers_operations.add(1, {"operation": "create", "status": "failure"})
        operation_duration.record(elapsed, {"operation": "create"})
        logger.error("customer_create_failed", extra={"customer_document": customer.document_id}, exc_info=True)
        raise


@router.put("/{customer_id}", response_model=CustomerResponse)
async def update_customer(
    customer_id: str,
    customer_update: CustomerUpdate,
    repository: CustomerRepository = Depends(get_repository),
):
    span = trace.get_current_span()
    span.set_attribute("customer.id", str(customer_id))
    start = time.monotonic()
    logger.info("customer_update_started", extra={"customer_id": customer_id})
    try:
        existing_customer = await repository.get_customer_by_id(customer_id)
        if not existing_customer:
            elapsed = time.monotonic() - start
            span.set_attribute("status", "not_found")
            customers_operations.add(1, {"operation": "update", "status": "not_found"})
            operation_duration.record(elapsed, {"operation": "update"})
            logger.warning("customer_not_found_for_update", extra={"customer_id": customer_id})
            raise HTTPException(status_code=404, detail="Customer not found")

        update_data = customer_update.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            setattr(existing_customer, field, value)

        updated_customer = await repository.update_customer(customer_id, existing_customer)
        elapsed = time.monotonic() - start
        if not updated_customer:
            span.set_attribute("status", "failure")
            span.set_attribute("exception.type", "UpdateFailed")
            span.set_status(StatusCode.ERROR, "customer_update_returned_none")
            customers_operations.add(1, {"operation": "update", "status": "failure"})
            operation_duration.record(elapsed, {"operation": "update"})
            logger.error("customer_update_failed", extra={"customer_id": customer_id})
            raise HTTPException(status_code=500, detail="Failed to update customer")

        span.set_attribute("status", "success")
        customers_operations.add(1, {"operation": "update", "status": "success"})
        operation_duration.record(elapsed, {"operation": "update"})
        logger.info("customer_update_completed", extra={"customer_id": customer_id})
        return updated_customer
    except HTTPException:
        raise
    except Exception as e:
        elapsed = time.monotonic() - start
        span.set_attribute("status", "failure")
        span.set_attribute("exception.type", type(e).__name__)
        span.set_status(StatusCode.ERROR, str(e))
        span.record_exception(e)
        customers_operations.add(1, {"operation": "update", "status": "failure"})
        operation_duration.record(elapsed, {"operation": "update"})
        logger.error("customer_update_failed", extra={"customer_id": customer_id}, exc_info=True)
        raise
