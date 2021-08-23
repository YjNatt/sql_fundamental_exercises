SELECT d.name, p.part_number
FROM parts AS p
INNER JOIN devices AS d ON d.id = p.device_id;
