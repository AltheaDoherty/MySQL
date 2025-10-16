-- Member Information
SELECT 
    MembershipID as "Membership ID", 
    FirstName as "First Name", 
    LastName as "Last Name", 
    MembershipTypes_membershipTypesID AS "Membership Type ID"
FROM Members;

-- Activities Offered
SELECT 
    ActivityID as "Activity ID", 
    ActivityName as "Activity Name", 
    Description
FROM Activities;

-- Employee Information
SELECT 
    EmployeeID as "Employee ID", 
    FirstName as "First Name", 
    LastName as "Last Name", 
    JobTitle as "Job Title", 
    department as "Department"
FROM Employees;

-- Member's Memberships
SELECT 
    M.MembershipID, 
    M.FirstName, 
    M.LastName, 
    MT.typeName
FROM Members M
INNER JOIN MembershipTypes MT ON M.MembershipTypes_membershipTypesID = MT.MembershipTypesID;

-- Highest Revenue Activity
SELECT 
    a.activityName, 
    SUM(pl.costPerSession) AS total_revenue
FROM activities a
JOIN privatelessons pl ON a.activityID = pl.Activities_activityID
GROUP BY a.activityName
ORDER BY total_revenue DESC
LIMIT 1;

-- Members from MA and RI
SELECT *
FROM members
WHERE state IN ('MA', 'RI');

-- Most Used Facilities
SELECT 
    f.facilityName, 
    COUNT(pl.Activities_activityID) AS usage_count
FROM facilities f
JOIN activities a ON f.Activities_activityID = a.activityID
JOIN privatelessons pl ON a.activityID = pl.Activities_activityID
GROUP BY f.facilityName
ORDER BY usage_count DESC;

-- Top Instructor for Each Activity
SELECT 
    a.activityName,
    (SELECT CONCAT(i.firstName, ' ', i.lastName)
     FROM privatelessons pl
     JOIN instructors i ON pl.Instructors_instructorsID = i.instructorsID
     WHERE pl.Activities_activityID = a.activityID
     GROUP BY pl.Instructors_instructorsID
     ORDER BY COUNT(pl.Instructors_instructorsID) DESC
     LIMIT 1) AS TopInstructor
FROM activities a;

-- Member Who Joined Most Recently
SELECT 
    membershipID,
    CONCAT(firstName, ' ', lastName) AS fullName,
    joinDate
FROM members
WHERE joinDate = (SELECT MAX(joinDate) FROM members);

-- Membership Type with Least Members
SELECT typeName AS membershipType, monthlyDues,memberCount
FROM 
    (SELECT mt.typeName, mt.monthlyDues, COUNT(m.membershipID) AS memberCount
     FROM membershiptypes AS mt
     LEFT JOIN members AS m ON mt.membershipTypesID = m.MembershipTypes_membershipTypesID
     GROUP BY mt.membershipTypesID, mt.typeName, mt.monthlyDues) AS membershipCounts
ORDER BY memberCount ASC
LIMIT 1;



