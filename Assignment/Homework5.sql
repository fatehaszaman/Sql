/* Fateha Zaman, HW5 */

/* Setting the database to ZAGI */
SET search_path TO zagi;

/* Query 5.1.2: Retrieve store IDs and ZIP codes */
SELECT storeid, storezip
FROM store;

/* Query 5.1.3: Retrieve customer names and ZIP codes, ordered by name */
SELECT customername, customerzip
FROM customer
ORDER BY customername;

/* Query 5.1.4: Retrieve all unique region IDs */
SELECT DISTINCT regionid
FROM store;

/* Query 5.1.5: Retrieve all stores in a specific region (example: region 1) */
SELECT *
FROM store
WHERE regionid = 1;

/* Query 5.1.6: Retrieve all customers whose name starts with 'A' */
SELECT customerid, customername
FROM customer
WHERE customername LIKE 'A%';

/* Query 5.1.7: Retrieve products with price greater than $100 */
SELECT productid, productname, productprice
FROM product
WHERE productprice > 100;

/* Query 5.1.8: Retrieve product info along with vendor name */
SELECT p.productid, p.productname, p.productprice, v.vendorname
FROM product p
JOIN vendor v ON p.vendorid = v.vendorid
ORDER BY p.productid;

/* Query 5.1.9: Retrieve product info with vendor and category */
SELECT p.productid, p.productname, p.productprice, v.vendorname, c.categoryname
FROM product p
JOIN vendor v ON p.vendorid = v.vendorid
JOIN category c ON p.categoryid = c.categoryid
ORDER BY p.productid;

/* Query 5.1.10: Retrieve products in the 'Camping' category */
SELECT p.productid, p.productname, p.productprice
FROM product p
JOIN category c ON p.categoryid = c.categoryid
WHERE c.categoryname = 'Camping'
ORDER BY p.productid;

/* Query 5.1.11: Retrieve products sold in stores with ZIP code 60600 */
SELECT p.productid, p.productname, p.productprice
FROM product p
JOIN includes i ON p.productid = i.productid
JOIN salestransaction st ON i.tid = st.tid
JOIN store s ON st.storeid = s.storeid
WHERE s.storezip = '60600'
ORDER BY p.productid;
