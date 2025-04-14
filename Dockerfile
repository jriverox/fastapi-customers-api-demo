FROM python:3.11.10

RUN apt-get update && \
    apt-get install -y git openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install poetry==2.0.1

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi --no-root

COPY src ./src

EXPOSE 8001

CMD ["poetry", "run", "python", "-m", "src.main"]