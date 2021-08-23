CREATE DATABASE billing; 

\c billing

CREATE TABLE customers (
    id serial PRIMARY KEY,
    name text NOT NULL,
    payment_token char(8) NOT NULL UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
    id serial PRIMARY KEY,
    description text NOT NULL,
    price numeric(10, 2) CHECK (price >= 0.00) NOT NULL
);

INSERT INTO customers (id, name, payment_token)
VALUES (1, 'Pat Johnson', 'XHGOAHEQ'),
       (2, 'Nancy Monreal', 'JKWQPJKL'),
       (3, 'Lynn Blake', 'KLZXWEEE'),
       (4, 'Chen Ke-Hua', 'KWETYCVX'),
       (5, 'Scott Lakso', 'UUEAPQPS'),
       (6, 'Jim Pornot', 'XKJEYAZA');

INSERT INTO services (id, description, price)
VALUES (1, 'Unix Hosting', 5.95),
       (2, 'DNS', 4.95),
       (3, 'Whois Registration', 1.95),
       (4, 'High Bandwidth', 15.00),
       (5, 'Business Support', 250.00),
       (6, 'Dedicated Hosting', 50.00),
       (7, 'Bulk Email', 250.00),
       (8, 'One-to-one Training', 999.00);

CREATE TABLE customers_services (
    id serial PRIMARY KEY,
    customer_id integer
      REFERENCES customers (id)
      NOT NULL,
    service_id integer
      REFERENCES services (id)
      NOT NULL
    UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
       (4, 1), (4, 4),
       (5, 1), (5, 2), (5, 6),
       (6, 1), (6, 6), (6, 8);

ALTER TABLE customers_services
DROP CONSTRAINT customers_services_customer_id_fkey;

ALTER TABLE customers_services
ADD FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE;
