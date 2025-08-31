/* Fateha Zaman, HW9 */

/* QUERY 1: Retrieve the total number of store_visits. */
	Select count (*) 
	From store_visits; 

/* QUERY 2: For each store, retrieve the store number, store name, and the number of store visits that occurred in that store. */
	SELECT si.store_nbr, si.store_name, COUNT(*) AS num_visits
  FROM store_information si
  JOIN store_visits sv ON si.store_nbr = sv.store_nbr
  GROUP BY si.store_nbr, si.store_name
  ORDER BY si.store_nbr;

/* QUERY 3: Using the table item_scan, retrieve the total number of records in the table item_scan, as well as the price of the most expensive item ever sold (i.e. the highest unit_retail_amount) */
	Select count(visit_nbr), max(unit_retail_amount)
	From item_scan;

/* QUERY 4: Retrieve the item number, primary description, secondary description and the price paid for the most expensive item ever sold. You are not allowed to use the result of the previous query (i.e. actual number) when writing the SQL statement for this query. If you receive more than one identical copy of the same record, find a way to display it only once. */
	SELECT item_desc.Item_Nbr, item_desc.Primary_Desc, item_desc.Secondary_Desc,
       MAX(item_scan.Unit_Retail_Amount) AS MaxPrice
  FROM item_desc
  JOIN item_scan ON item_scan.Item_Nbr = item_desc.Item_Nbr
  GROUP BY item_desc.Item_Nbr, item_desc.Primary_Desc, item_desc.Secondary_Desc
  ORDER BY MaxPrice DESC;

/* QUERY 5: Create your own original query that retrieves something else that is interesting, from the UA_SAMSCLUB database. Show the item number, unit retail amount, primary description, and expiration date for all items whose unit retail amount is greater than $500 and sort by the expiration dates */
	SELECT s.item_nbr, s.unit_retail_amount, d.primary_desc, d.expiration_date
  FROM item_scan s
  JOIN item_desc d ON s.item_nbr = d.item_nbr
  WHERE s.unit_retail_amount > 500
  ORDER BY d.expiration_date;
