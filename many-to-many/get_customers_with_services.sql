SELECT DISTINCT customers.*
FROM customers
RIGHT OUTER JOIN customers_services
              ON customers_services.customer_id = customers.id;
