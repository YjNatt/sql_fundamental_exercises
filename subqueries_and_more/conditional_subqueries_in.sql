SELECT name AS "Bid on Items"
FROM items
WHERE ID IN (SELECT DISTINCT item_id FROM bids);
