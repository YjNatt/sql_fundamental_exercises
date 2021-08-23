SELECT items.name,
       (SELECT COUNT(id) FROM bids WHERE bids.item_id = items.id)
FROM items;

SELECT items.name, COUNT(bids.id)
FROM items
LEFT OUTER JOIN bids ON bids.item_id = items.id
GROUP BY items.id
ORDER BY items.id;
