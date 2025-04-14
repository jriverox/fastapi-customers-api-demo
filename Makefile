.PHONY: install run test lint clean docker-build docker-run

install:
	poetry install

run:
	poetry run uvicorn src.main:app --reload --port 8001

test:
	poetry run pytest

lint:
	poetry run black src tests
	poetry run isort src tests
	poetry run flake8 src tests

clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.pyd" -delete
	find . -type d -name "*.egg-info" -exec rm -r {} +
	find . -type d -name "*.egg" -exec rm -r {} +
	find . -type d -name ".pytest_cache" -exec rm -r {} +
	find . -type d -name ".coverage" -exec rm -r {} +

docker-build:
	docker build -t fastapi-customers-api .

docker-run:
	docker run -p 8001:8001 -e HOST=0.0.0.0 -e PORT=8001 fastapi-customers-api