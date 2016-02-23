-- 2
CREATE VIEW DEPT_SUMMARY (D, C, Total_s, Average_s)
AS SELECT Dno, COUNT (*), SUM (Salary), AVG (Salary)
FROM EMPLOYEE
GROUP BY Dno;

-- 2a
-- ON VIEW
SELECT *
FROM DEPT_SUMMARY;

-- ON BASE TABLE
SELECT Employee.Dno, COUNT(*), SUM(Employee.Salary), AVG(Employee.Salary)
FROM Employee
GROUP BY Employee.Dno;

-- 2b
-- ON VIEW
SELECT D, C
FROM DEPT_SUMMARY
WHERE TOTAL_S > 100000;

-- ON BASE TABLE
SELECT Employee.Dno, COUNT(*) 
FROM Employee
HAVING SUM(Employee.Salary) > 100000
GROUP BY Dno;

-- 2c
-- ON VIEW
SELECT D, AVERAGE_S
FROM DEPT_SUMMARY
WHERE C > (
  SELECT C 
  FROM DEPT_SUMMARY 
  WHERE D=4
);

-- ON BASE TABLE
SELECT Employee.Dno, AVG(Employee.Salary) 
FROM Employee
HAVING COUNT(*) > (
  SELECT COUNT(*)
  FROM Employee
  WHERE Employee.Dno = 4
  GROUP BY Dno
)
GROUP BY Dno;

-- 2d
-- ON VIEW
UPDATE DEPT_SUMMARY
SET D=3
WHERE D=4;

-- When you are updating a view, it just changes what is seen
-- By changing d=4 to d=3, you are just changing what is shown for the tuple where d=4
-- You can't do this with normal select statements

-- 2e
-- ON VIEW
DELETE FROM DEPT_SUMMARY
WHERE C > 4;

-- There is no C > 4, and deleting from a view is the same as just not including it
-- Since you can't not include something that doesn't exist
-- it's impossible

DROP VIEW DEPT_SUMMARY;