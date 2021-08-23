SELECT SUM(services.price)
FROM services
INNER JOIN customers_services ON customers_services.service_id = services.id
WHERE services.price > 100;

SELECT SUM(price)
FROM customers
CROSS JOIN services
WHERE price > 100;

SELECT (COUNT(customers.id) * 
       (SELECT SUM(services.price)
        FROM services WHERE price > 100)) 
       AS "sum"
FROM customers;
