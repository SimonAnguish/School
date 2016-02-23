ALTER TABLE Employee DROP CONSTRAINT fnk_super_ssn_employee;
ALTER TABLE Department DROP CONSTRAINT fnk_mgr_ssn_department;
ALTER TABLE Employee DROP CONSTRAINT fnk_dno_employee;
ALTER TABLE Dept_Locations DROP CONSTRAINT fnk_dnumber_dept_locations;
ALTER TABLE Project DROP CONSTRAINT fnk_dnum_project;
ALTER TABLE Works_On DROP CONSTRAINT fnk_essn_works_on;
ALTER TABLE Works_On DROP CONSTRAINT fnk_pno_works_on;
ALTER TABLE Dependent DROP CONSTRAINT fnk_essn_dependent;

DROP TABLE Dependent;
DROP TABLE Project;
DROP TABLE Works_On;
DROP TABLE Dept_Locations;
DROP TABLE Department;
DROP TABLE Employee;