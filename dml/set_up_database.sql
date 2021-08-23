CREATE DATABASE workshop;

\c workshop

CREATE TABLE devices (
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parts (
    id serial PRIMARY KEY,
    part_number integer UNIQUE NOT NULL,
    device_id integer REFERENCES devices (id)
);
