SELECT customers.*
FROM customers
LEFT OUTER JOIN customers_services
             ON customers_services.customer_id = customers.id
WHERE customers_services.id IS NULL;

SELECT customers.*, services.*
FROM customers
FULL OUTER JOIN customers_services ON customer_services.customer_id = customers.id
FULL OUTER JOIN services ON services.id = customer_services.service_id 
WHERE customers_services.id IS NULL
ORDER BY customers.id, services.id;
