SELECT services.description
FROM customers_services
RIGHT OUTER JOIN services ON services.id = customers_services.service_id
WHERE customers_services.id IS NULL;
