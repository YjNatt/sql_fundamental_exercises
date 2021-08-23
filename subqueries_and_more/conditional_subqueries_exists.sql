SELECT name 
FROM bidders
WHERE EXISTS (SELECT bidder_id FROM bids WHERE bids.bidder_id = bidders.id);

SELECT DISTINCT bidders.name
FROM bidders
INNER JOIN bids ON bids.bidder_id = bidders.id
WHERE bids.bidder_id = bidders.id;
