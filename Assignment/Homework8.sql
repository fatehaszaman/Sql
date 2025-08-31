/* Fateha Zaman, HW8 */
/* Setting the database to HAFH */
SET search_path TO hafh;

/* 5.2.11: Retrieve building ID and apartment number for clients named 'WindyCT' */
SELECT a.buildingid, a.aptno
FROM apartment a
JOIN corpclient c ON a.ccid = c.ccid
WHERE c.ccname = 'WindyCT';

/* 5.2.12: Retrieve distinct inspectors with next inspection date after April 1, 2020 */
SELECT DISTINCT ir.insid, ir.insname
FROM inspector ir
JOIN inspecting ig ON ir.insid = ig.insid
WHERE ig.datenext > '2020-04-01';

/* 5.2.13: Retrieve managers whose salary is above the average salary */
SELECT ManagerID, MFName, MLName, MSalary
FROM Manager
WHERE MSalary > (SELECT AVG(MSalary) FROM Manager);

/* 5.2.14 & 5.2.15: Count the number of buildings managed by each manager */
SELECT m.ManagerID, m.MFName, m.MLName, COUNT(b.buildingid) AS Buildings_Managed
FROM Manager m
JOIN Building b ON m.managerid = b.bmanagerid
GROUP BY m.ManagerID, m.MFName, m.MLName;

/* 5.2.16: Count the number of apartments cleaned by each staff member */
SELECT s.smemberid, s.smembername, COUNT(c.aptno) AS Apartments_Cleaned
FROM Staffmember s
JOIN Cleaning c ON s.smemberid = c.smemberid
GROUP BY s.smemberid, s.smembername;

/* 5.2.17: Retrieve staff members who cleaned apartments for clients in Chicago */
SELECT DISTINCT s.smemberid, s.smembername
FROM Staffmember s
JOIN Cleaning cl ON s.smemberid = cl.smemberid
JOIN Apartment a ON a.aptno = cl.aptno AND a.buildingid = cl.buildingid
JOIN Corpclient cc ON a.ccid = cc.ccid
WHERE cc.cclocation = 'Chicago';

/* 5.2.18: List clients referred by clients in the 'Music' industry */
SELECT c1.ccname AS client, c2.ccname AS referredby
FROM corpclient c1
JOIN corpclient c2 ON c2.ccid = c1.ccidreferredby
WHERE c2.ccindustry = 'Music';

/* 5.2.19: Retrieve apartments not assigned to any client */
SELECT buildingid, aptno, anoofbedrooms
FROM apartment
WHERE ccid IS NULL;

/* 5.2.20: Retrieve the manager with the lowest combined salary + bonus */
SELECT ManagerID, MFName, MLName, MSalary, MBonus
FROM Manager
ORDER BY MSalary + MBonus
LIMIT 1;
