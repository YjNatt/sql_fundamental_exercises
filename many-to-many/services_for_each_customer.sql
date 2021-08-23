SELECT customers.name,
       STRING_AGG(services.description, (', ')) AS services
FROM customers
LEFT OUTER JOIN customers_services 
             ON customers_services.customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = customers_services.service_id
GROUP BY customers.id
ORDER BY customers.id;
