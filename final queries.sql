-- ONE TABLE QUERIES
-- 1

--shows member information
SELECT 
MembershipID as "Membership ID", 
FirstName as "First Name", 
LastName as "Last Name", 
MembershipTypes_membershipTypesID AS "Membership Type ID"
FROM Members;

-- 2

--shows activities offered
SELECT ActivityID as "Activity ID", 
ActivityName as "Activity Name", 
Description
FROM Activities;

-- 3

--shows employee information
SELECT EmployeeID as "Employee ID", 
FirstName as "First Name", 
LastName as "Last Name", 
JobTitle as "Job Title", 
department as "Department"
FROM Employees;

-- MULTI TABLE

--displays members' memberships with the name
SELECT 
    M.MembershipID, 
    M.FirstName, 
    M.LastName, 
    MT.typeName
FROM Members M
INNER JOIN MembershipTypes MT ON M.MembershipTypes_membershipTypesID = MT.MembershipTypesID;

-- 2

