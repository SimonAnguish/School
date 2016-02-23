-- Verify A

INSERT INTO Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES (NULL, 6, NULL, NULL);

-- Returns any departments without at least 1 employee

SELECT Department.Dnumber
FROM Department
MINUS 
SELECT DISTINCT Employee.Dno
FROM Employee;

DELETE FROM Department
WHERE Department.Dnumber = 6;

-- Verify B

SELECT Employee.Fname, Employee.Lname
FROM Employee
INNER JOIN Dependent
ON Employee.Ssn=Dependent.Essn
WHERE Employee.Salary < 35000
AND COUNT(Dependent.Dependent_name) > 2;

-- Verify C

SELECT Employee.Fname, Employee.Lname
FROM Employee, Works_On
WHERE Employee.Ssn = Works_On.Essn
AND SUM(Works_On.Hours) < 37.5;