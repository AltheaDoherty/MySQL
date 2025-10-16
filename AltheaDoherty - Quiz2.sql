-- QUIZ 2: Joins	 Althea Doherty		10/31/24

-- QUESTION 1
SELECT b.BuildingName, b.Description, b.Floors, cr.ClassNumber, cr.Floor, cr.Capacity
FROM building AS b
INNER JOIN classroom AS cr
	ON b.BuildingName = cr.BuildingName
WHERE cr.Capacity < 30;
-- 7 rows returned

-- QUESTION 2
SELECT c.CourseID AS "Course ID", c.CourseName, c.Credits
FROM course AS c
INNER JOIN section AS s
	ON c.CourseID = s.CourseID
ORDER BY "Course ID";
-- 15 rows returned



-- QUESTION 3
SELECT c.CourseID AS "Course ID", c.CourseName, c.Credits, s.SectionID, s.StartTime, s.EndTime
FROM course AS c
INNER JOIN section AS s
	ON c.CourseID = s.CourseID
ORDER BY "Course ID";
-- 15 rows returned

-- QUESTION 4
SELECT e.FirstName, e.LastName, e.StartDate, f.HighestDegree
FROM employee AS e
INNER JOIN faculty AS f
	ON e.EmployeeID = f.EmployeeID
ORDER BY e.LastName;
-- 36 rows returned

-- QUESTION 5
SELECT cr.ClassNumber, cr.BuildingName, cr.Floor, cr.Capacity, s.SectionID
FROM classroom AS cr
INNER JOIN section AS s
	ON cr.ClassNumber = s.ClassNumber
WHERE s.SectionID IS NULL;
-- 0 rows returned

-- QUESTION 6
SELECT CONCAT(e.FirstName, " ", e.LastName) AS "Faculty Name", c.ClassNumber, b.Description, b.Floors, 
s.SectionID, s.StartTime, s.EndTime, cr.CourseName, cr.Description
FROM faculty AS f
INNER JOIN employee AS e 
	ON f.EmployeeID = e.EmployeeID
INNER JOIN section AS s 
	ON f.EmployeeID = s.EmployeeID
INNER JOIN course AS cr 
	ON s.CourseID = cr.CourseID
INNER JOIN classroom AS c 
	ON s.ClassNumber = c.ClassNumber
INNER JOIN building b ON c.BuildingName = b.BuildingName
WHERE s.SectionID = "ACCTG202-01-SP20";
-- 1 row returned
