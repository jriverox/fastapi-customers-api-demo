CREATE TABLE IF NOT EXISTS customers (
    id           VARCHAR PRIMARY KEY,
    first_name   VARCHAR NOT NULL,
    last_name    VARCHAR NOT NULL,
    birthday     DATE,               -- o VARCHAR si el formato no es estándar
    document_id  VARCHAR NOT NULL,
    phone_number VARCHAR(20),
    email        VARCHAR(255) NOT NULL,
    address      VARCHAR NOT NULL,
    city         VARCHAR NOT NULL,
    state        VARCHAR NOT NULL,
    zip_code     VARCHAR(10),
    country      VARCHAR NOT NULL
);

