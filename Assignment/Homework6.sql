/* Fateha Zaman, HW6 */

/* Setting the database to ZAGI */
SET search_path TO zagi;

/* Query 5.1.12 */
SELECT DISTINCT p.productid, p.productname, p.productprice
FROM product p
JOIN vendor v ON p.vendorid = v.vendorid
JOIN includes i ON p.productid = i.productid
JOIN salestransaction st ON st.tid = i.tid
JOIN store s ON s.storeid = st.storeid
JOIN region r ON s.regionid = r.regionid
WHERE r.regionname = 'Tristate'
ORDER BY p.productid;

/* Query 5.1.13 */
SELECT st.TID, c.customername, st.tdate
FROM salestransaction st
JOIN customer c ON st.customerid = c.customerid
JOIN includes i ON st.tid = i.tid
JOIN product p ON i.productid = p.productid
WHERE p.productname = 'Easy Boot';

/* Query 5.1.14 */
SELECT r.regionid, r.regionname, COUNT(*) AS store_count
FROM region r
JOIN store s ON r.regionid = s.regionid
GROUP BY r.regionid, r.regionname;

/* Query 5.1.15 */
SELECT c.categoryid, c.categoryname, AVG(p.productprice) AS avg_price
FROM product p
JOIN category c ON p.categoryid = c.categoryid
GROUP BY c.categoryid, c.categoryname;

/* Query 5.1.16 */
SELECT p.categoryid, SUM(i.quantity) AS total_quantity
FROM includes i
JOIN product p ON p.productid = i.productid
GROUP BY p.categoryid;

/* Query 5.1.17 */
SELECT r.regionid, r.regionname, SUM(i.quantity * p.productprice) AS AmountSpent
FROM region r
JOIN store s ON r.regionid = s.regionid
JOIN salestransaction st ON st.storeid = s.storeid
JOIN includes i ON i.tid = st.tid
JOIN product p ON p.productid = i.productid
GROUP BY r.regionid, r.regionname;

/* Query 5.1.18 */
SELECT tid, SUM(quantity) AS total_quantity
FROM includes
GROUP BY tid
HAVING SUM(quantity) > 5;

/* Query 5.1.19 */
SELECT v.vendorid, v.vendorname, SUM(i.quantity * p.productprice) AS TotalSales
FROM vendor v
JOIN product p ON p.vendorid = v.vendorid
JOIN includes i ON i.productid = p.productid
GROUP BY v.vendorid, v.vendorname
HAVING SUM(i.quantity * p.productprice) > 700;

/* Query 5.1.20 */
SELECT productid, productname, productprice
FROM product
WHERE productprice = (SELECT MIN(productprice) FROM product);

/* Query 5.1.21 */
SELECT p.productid, p.productname, v.vendorname
FROM product p
JOIN vendor v ON p.vendorid = v.vendorid
WHERE p.productprice < (SELECT AVG(productprice) FROM product);

/* Query 5.1.22 */
SELECT p.productid, p.productname
FROM product p
JOIN includes i ON p.productid = i.productid
GROUP BY p.productid, p.productname
HAVING SUM(i.quantity) > 2
ORDER BY p.productid;
