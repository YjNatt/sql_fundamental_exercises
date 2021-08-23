SELECT id
FROM items
WHERE ROW('Painting', 100.00, 250.00) = (name, intial_price, sales_price);
