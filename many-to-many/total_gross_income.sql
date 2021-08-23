SELECT SUM(s.price) AS gross
FROM services AS s
INNER JOIN customers_services AS cs
        ON cs.service_id = s.id;
