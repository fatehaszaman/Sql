/* Fateha Zaman, HW7 */
/* Setting the database to HAFH */
SET search_path TO HAFH;

/* 5.2.1 */
SELECT SMemberID, SMemberName
FROM StaffMember;

/* 5.2.2 */
SELECT BuildingID, BNoOfFloors
FROM Building;

/* 5.2.3 */
SELECT CcID, CcName, CcIndustry
FROM CorpClient
ORDER BY CcName;

/* 5.2.4 */
SELECT StaffMemberID, StaffMemberName
FROM StaffMember
WHERE SMemberName LIKE 'B%';

/* 5.2.5 */
SELECT BuildingID, AptNo, ANoOfBedrooms
FROM Apartment
WHERE ANoOfBedrooms > 1;

/* 5.2.6 */
SELECT COUNT(*) AS NumBuildings
FROM Building
WHERE BNoOfFloors = 4;

/* 5.2.7 */
SELECT SUM(MSalary) AS TotalSalary, SUM(MBonus) AS TotalBonus
FROM Manager;

/* 5.2.8 */
SELECT ManagerID, MFName, MLName, MBDate, MSalary, MBonus
FROM Manager
WHERE MSalary > 50000
  AND MBonus > 1000;

/* 5.2.9 */
SELECT b.BuildingID, b.BNoOfFloors, m.MFName, m.MLName
FROM Building b
JOIN Manager m ON b.BManagerID = m.ManagerID;

/* 5.2.10 */
SELECT m.MFName, m.MLName, m.MSalary, m.MBDate, COUNT(b.BuildingID) AS NoOfBuilding
FROM Manager m
JOIN Building b ON b.BManagerID = m.ManagerID
WHERE m.MSalary > 50000
GROUP BY m.MFName, m.MLName, m.MSalary, m.MBDate;
