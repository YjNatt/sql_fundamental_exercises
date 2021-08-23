SELECT *
FROM parts
WHERE ('' || part_number) LIKE '3%';
