# FastAPI Customers API

A simple REST API for managing cars built with FastAPI and Python 3.12.

## Features

- CRUD operations for cars
- Pagination support
- Input validation using Pydantic
- Mock data storage in JSON format
- Docker support
- Poetry for dependency management

## Project Structure

```
/src/
  /models/
    /customer.py
  /repositories/
    /customer.py
  /routes/
    /healthcheck.py
    /customer.py
  /schemas/
    customer.py
  main.py
  setting.py
/tests/
Dokerfile
Makefile
README.md
```

## API Endpoints

- `GET /health` - Health check endpoint
- `GET /customer` - Get list of customer (paginated)
- `GET /customer/{id}` - Get customer by ID
- `POST /customer` - Create new customer
- `PUT /customer/{id}` - Update existing customer

## Getting Started

### Prerequisites

- Python 3.12
- Poetry
- Docker (optional)

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   make install
   ```

### Running the Application

To run the application locally:

```bash
make run
```

The API will be available at `http://localhost:8000`

### Running with Docker

To build and run the Docker container:

```bash
make docker-build
make docker-run
```

### Development

- Run tests:

  ```bash
  make test
  ```

- Run linters:

  ```bash
  make lint
  ```

- Clean up:
  ```bash
  make clean
  ```

## API Documentation

Once the application is running, you can access the API documentation at:

- Swagger UI: `http://localhost:8000/docs`
- ReDoc: `http://localhost:8000/redoc`

## License

This project is licensed under the MIT License.
