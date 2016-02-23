-- C

SELECT Employee.Fname, Employee.Lname 
FROM Employee
WHERE Super_ssn = (
  SELECT Employee.Ssn 
  FROM Employee
  WHERE Employee.Fname = 'Franklin'
  AND Employee.Lname = 'Wong'
);

-- D

SELECT Project.Pname, SUM(Works_On.Hours)
FROM Project, Works_On 
WHERE Works_On.Pno = Project.Pnumber
GROUP BY Project.Pname;

-- E



-- F

DELETE FROM Works_On 
WHERE Essn = 888665555 
AND Pno = 20;

SELECT Employee.Fname, Employee.Lname 
FROM Employee 
WHERE Employee.Ssn IN (
  SELECT Employee.Ssn
  FROM Employee
  MINUS
  SELECT Works_On.Essn 
  FROM Works_On, Project
  WHERE Works_On.Pno = Project.Pnumber
);

INSERT INTO Works_On (Essn,Pno,Hours)
VALUES (888665555,20,NULL);

-- G

SELECT Department.Dname, AVG(Employee.Salary)
FROM Department, Employee
WHERE Department.Dnumber = Employee.Dno
GROUP BY Department.Dname;

-- H

SELECT AVG(Employee.Salary)
FROM Employee
WHERE Employee.Sex = 'F'
GROUP BY Employee.Sex;

-- I

SELECT DISTINCT Employee.Fname, Employee.Lname, Employee.Address
FROM Employee, Works_On, Project, Dept_Locations
WHERE Employee.Ssn = Works_On.Essn
AND Works_On.Pno = Project.Pnumber
AND Project.Dnum = Dept_Locations.Dnumber
AND Project.Plocation = 'Houston'
AND Dept_Locations.Dlocation != 'Houston';

-- J

SELECT Employee.Fname, Employee.Lname
FROM Employee, Department
WHERE Employee.Ssn = Department.Mgr_ssn
MINUS
SELECT Employee.Fname, Employee.Lname
FROM Employee, Dependent
WHERE Employee.Ssn = Dependent.Essn;

-- 5.5 B

SELECT Department.Dname, COUNT(Employee.Ssn)
FROM Department, Employee
WHERE Employee.Dno = Department.Dnumber
AND (
  SELECT AVG(Employee.Salary)
  FROM Employee
) > 30000
AND Employee.Sex = 'M'
GROUP BY Department.Dname;