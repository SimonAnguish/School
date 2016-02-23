-- 1
CREATE OR REPLACE FUNCTION deptavgsal(
  deptnum
  in Department.Dnumber%type
  default NULL)
RETURN number AS avgsal number;
BEGIN
  IF deptnum IS NULL THEN
    RETURN -1;
  ELSE
    SELECT AVG(Employee.Salary) INTO avgsal
    FROM Department, Employee
    WHERE Employee.Dno = Department.Dnumber
    AND Department.Dnumber = deptnum
    GROUP BY Department.Dnumber;
    
    IF avgsal IS NULL THEN
      RETURN -2;
    ELSE
      RETURN avgsal;
    END IF;
  END IF;
END;
/

-- 2
-- NULL
SELECT deptavgsal() FROM DUAL;

-- INVALID
SELECT deptavgsal(2) FROM DUAL;
SELECT deptavgsal(3) FROM DUAL;
SELECT deptavgsal(6) FROM DUAL;

-- VALID
SELECT deptavgsal(1) FROM DUAL;
SELECT deptavgsal(4) FROM DUAL;
SELECT deptavgsal(5) FROM DUAL;

-- 3
SELECT Department.Dname, deptavgsal(Department.Dnumber)
FROM Department
HAVING deptavgsal(Department.Dnumber) > 32000
GROUP BY Department.Dnumber
ORDER BY Department.Dnumber ASC;

-- 4
DROP FUNCTION deptavgsal;