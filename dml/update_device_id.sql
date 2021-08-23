UPDATE parts
SET device_id = 1
WHERE part_number = 10203 OR  = part_number = 10204;

UPDATE parts
SET device_id = 2
WHERE part_number = (SELECT MIN(part_number) FROM parts);
