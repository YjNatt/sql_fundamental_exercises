CREATE DATABASE auction;

\c auction

CREATE TABLE bidders (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    initial_price NUMERIC(6, 2) CHECK(initial_price BETWEEN 0.01 AND 1000.00) NOT NULL,
    sales_price NUMERIC(6, 2) CHECK(sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
    id SERIAL PRIMARY KEY,
    bidder_id INTEGER REFERENCES bidders (id) ON DELETE CASCADE NOT NULL,
    item_id INTEGER REFERENCES items (id) ON DELETE CASCADE NOT NULL,
    amount NUMERIC(6, 2) CHECK(amount BETWEEN 0.01 AND 1000.00) NOT NULL
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM '/home/yujohn/Desktop/sql-files/bidders.csv' HEADER CSV 
\copy items FROM '/home/yujohn/Desktop/sql-files/items.csv' HEADER CSV 
\copy bids FROM '/home/yujohn/Desktop/sql-files/bids.csv' HEADER CSV 
