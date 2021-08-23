SELECT part_number, device_id
FROM parts
WHERE part_number IS NOT NULL;

SELECT part_number, device_id
FROM parts
WHERE part_number IS NULL;
