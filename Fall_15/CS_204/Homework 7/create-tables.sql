CREATE TABLE Employee
(
  Fname varchar(31),
  Minit varchar(1),
  Lname varchar(31),
  Ssn int NOT NULL,
  Bdate date,
  Address varchar(255),
  Sex varchar(1) CHECK (Sex IN ('F','M')),
  Salary int CHECK (Salary>20000),
  Super_ssn int,
  Dno int,
  CONSTRAINT pmk_employee PRIMARY KEY (Ssn),
  CONSTRAINT fnk_super_ssn_employee FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn)
);

CREATE TABLE Department
(
  Dname varchar(255),
  Dnumber int NOT NULL,
  Mgr_ssn int,
  Mgr_start_date date,
  CONSTRAINT pmk_department PRIMARY KEY (Dnumber),
  CONSTRAINT fnk_mgr_ssn_department FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn)
);

ALTER TABLE EMPLOYEE ADD CONSTRAINT fnk_dno_employee FOREIGN KEY (Dno) REFERENCES Department(Dnumber);

CREATE TABLE Dept_Locations
(
  Dnumber int NOT NULL,
  Dlocation varchar(255) NOT NULL,
  CONSTRAINT pmk_dept_locations PRIMARY KEY(Dnumber, Dlocation),
  CONSTRAINT fnk_dnumber_dept_locations FOREIGN KEY(Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Project
(
  Pname varchar(255),
  Pnumber int NOT NULL,
  Plocation varchar(255) CHECK (Plocation IN ('Bellaire','Sugarland','Houston','Stafford')),
  Dnum int,
  CONSTRAINT pmk_project PRIMARY KEY(Pnumber),
  CONSTRAINT fnk_dnum_project FOREIGN KEY(Dnum) REFERENCES Department(Dnumber)
);

CREATE TABLE Works_On
(
  Essn int NOT NULL,
  Pno int NOT NULL,
  Hours float CHECK (Hours BETWEEN 5 AND 40),
  CONSTRAINT pmk_works_on PRIMARY KEY(Essn, Pno),
  CONSTRAINT fnk_essn_works_on FOREIGN KEY(Essn) REFERENCES Employee(Ssn),
  CONSTRAINT fnk_pno_works_on FOREIGN KEY(Pno) REFERENCES Project(Pnumber)
);

CREATE TABLE Dependent
(
  Essn int NOT NULL,
  Dependent_name varchar(31) NOT NULL,
  Sex varchar(1),
  Bdate date,
  Relationship varchar(31),
  CONSTRAINT pmk_dependent PRIMARY KEY(Essn, Dependent_name),
  CONSTRAINT fnk_essn_dependent FOREIGN KEY(Essn) REFERENCES Employee(Ssn)
);