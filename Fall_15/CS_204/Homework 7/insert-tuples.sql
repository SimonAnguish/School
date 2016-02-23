-- Insert into Employee table

ALTER TABLE Employee DROP CONSTRAINT fnk_super_ssn_employee;
ALTER TABLE Department DROP CONSTRAINT fnk_mgr_ssn_department;
ALTER TABLE Employee DROP CONSTRAINT fnk_dno_employee;
ALTER TABLE Dept_Locations DROP CONSTRAINT fnk_dnumber_dept_locations;
ALTER TABLE Project DROP CONSTRAINT fnk_dnum_project;
ALTER TABLE Works_On DROP CONSTRAINT fnk_essn_works_on;
ALTER TABLE Works_On DROP CONSTRAINT fnk_pno_works_on;
ALTER TABLE Dependent DROP CONSTRAINT fnk_essn_dependent;

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('John','B','Smith',123456789,date '1965-01-09','731 Hondren, Houston, TX','M',30000,333445555,5);

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('Franklin','T','Wong',333445555,date '1955-12-08','638 Voss, Houston, TX','M',40000,888665555,5);

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('Alicia','J','Zelaya',999887777,date '1968-01-19','3321 Castle, Spring, TX','F',25000,987654321,4);

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('Jennifer','S','Wallace',987654321,date '1941-06-20','291 Berry, Bellaire, TX','F',43000,888665555,4);

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('Ramesh','K','Narayan',666884444,date '1962-09-15','975 Fire Oak, Humble, TX','M',38000,333445555,5);

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('Joyce','A','English',453453453,date '1972-07-31','5631 Rice, Houston, TX','F',25000,333445555,5);

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('Ahmad','V','Jabbar',987987987,date '1969-03-29','980 Dallas, Houston, TX','M',25000,987654321,4);

INSERT INTO Employee (Fname,Minit,Lname,Ssn,Bdate,Address,Sex,Salary,Super_ssn,Dno)
VALUES('James','E','Borg',888665555,date '1937-11-10','450 Stone, Houston, TX','M',55000,NULL,1);

-- Insert into Department table

INSERT INTO Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES('Research',5,333445555,date '1988-05-22');

INSERT INTO Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES('Administration',4,987654321,date '1995-01-01');

INSERT INTO Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES('Headquarters',1,888665555,date '1981-06-19');

-- Insert into Dept_Locations table

INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES (1,'Houston');

INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES (4,'Stafford');

INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES (5,'Bellaire');

INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES (5,'Sugarland');

INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES (5,'Houston');

-- Insert into Works_On table

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (123456789, 1, 32.5);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (123456789, 2, 7.5);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (666884444, 3, 40.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (453453453, 1, 20.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (453453453, 2, 20.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (333445555, 2, 10.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (333445555, 3, 10.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (333445555, 10, 10.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (333445555, 20, 10.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (999887777, 30, 30.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (999887777, 10, 10.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (987987987, 10, 35.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (987987987, 30, 5.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (987654321, 30, 20.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (987654321, 20, 15.0);

INSERT INTO Works_On (Essn, Pno, Hours)
VALUES (888665555, 20, NULL);

-- Insert into Project table

INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)
VALUES ('ProductX',1,'Bellaire',5);

INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)
VALUES ('ProductY',2,'Sugarland',5);

INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)
VALUES ('ProductZ',3,'Houston',5);

INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)
VALUES ('Computerization',10,'Stafford',4);

INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)
VALUES ('Reorganization',20,'Houston',1);

INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)
VALUES ('Newbenefits',30,'Stafford',4);

-- Insert into Dependents table

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES (333445555,'Alice','F',date '1986-04-05','Daughter');

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES (333445555,'Theodore','M',date '1983-10-25','Son');

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES (333445555,'Joy','F',date '1958-05-03','Spouse');

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES (987654321,'Abner','M',date '1942-02-28','Spouse');

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES (123456789,'Michael','M',date '1988-01-04','Son');

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES (123456789,'Alice','F',date '1988-12-30','Daughter');

INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES (123456789,'Elizabeth','F',date '1967-05-05','Spouse');

ALTER TABLE Employee ADD CONSTRAINT fnk_super_ssn_employee FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn);

ALTER TABLE Department ADD CONSTRAINT fnk_mgr_ssn_department FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn);

ALTER TABLE Employee ADD CONSTRAINT fnk_dno_employee FOREIGN KEY (Dno) REFERENCES Department(Dnumber);

ALTER TABLE Dept_Locations ADD CONSTRAINT fnk_dnumber_dept_locations FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

ALTER TABLE Project ADD CONSTRAINT fnk_dnum_project FOREIGN KEY (Dnum) REFERENCES Department(Dnumber);

ALTER TABLE Works_On ADD CONSTRAINT fnk_pno_works_on FOREIGN KEY (Pno) REFERENCES Project(Pnumber);

ALTER TABLE Dependent ADD CONSTRAINT fnk_essn_dependent FOREIGN KEY (Essn) REFERENCES Employee(Ssn);