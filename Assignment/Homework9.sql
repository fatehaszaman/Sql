/* Fateha Zaman, HW9 */

/* QUERY 1: Retrieve the total number of store_visits. */
SELECT COUNT(*) AS total_visits
FROM store_visits;

/* QUERY 2: For each store, retrieve the store number, store name, and the number of store visits that occurred in that store. */
SELECT si.store_nbr, si.store_name, COUNT(*) AS num_visits
FROM store_information si
JOIN store_visits sv ON si.store_nbr = sv.store_nbr
GROUP BY si.store_nbr, si.store_name
ORDER BY si.store_nbr;

/* QUERY 3: Using the table item_scan, retrieve the total number of records in the table item_scan, as well as the price of the most expensive item ever sold */
SELECT COUNT(visit_nbr) AS total_records, MAX(unit_retail_amount) AS max_price
FROM item_scan;

/* QUERY 4: Retrieve the item number, primary description, secondary description, and the price paid for the most expensive item ever sold */
SELECT item_desc.Item_Nbr, item_desc.Primary_Desc, item_desc.Secondary_Desc,
       MAX(item_scan.Unit_Retail_Amount) AS MaxPrice
FROM item_desc
JOIN item_scan ON item_scan.Item_Nbr = item_desc.Item_Nbr
GROUP BY item_desc.Item_Nbr, item_desc.Primary_Desc, item_desc.Secondary_Desc
ORDER BY MaxPrice DESC;

/* QUERY 5: Show item number, unit retail amount, primary description, and expiration date for items priced over $500, sorted by expiration date */
SELECT s.item_nbr, s.unit_retail_amount, d.primary_desc, d.expiration_date
FROM item_scan s
JOIN item_desc d ON s.item_nbr = d.item_nbr
WHERE s.unit_retail_amount > 500
ORDER BY d.expiration_date;
