create cluster dept_cluster 
(dnumber decimal(2));

create table Department (
  dname varchar(20),
  dnumber decimal(2) primary key,
  mgrssn decimal(9), -- omit the foreign key constraint to Employee.ssn.
  mgrstartdate date
) cluster dept_cluster (dnumber);

create table Dept_locations (
  dnumber decimal(2) references Department(dnumber),
  dlocation varchar(20),
  constraint dept_locs_pmk primary key (dnumber, dlocation)
) cluster dept_cluster (dnumber);

create table Project (
  pname varchar(20),
  pnumber decimal(2) primary key,
  plocation varchar(20),
  dnum decimal(2) references Department(dnumber)
) cluster dept_cluster (dnum);

commit;

create index dnumber on cluster dept_cluster;

commit;

/* Insert tuples to Department, Dept_locations, and Project only. */
start insert_tuples_dept_locs_projs.sql;

-- (1)
select * from Department;
select * from Dept_locations;
select * from Project;

-- (2)
select dlocation, pname 
from Dept_locations, Project, Department 
where dname = 'Administration' 
and Dept_locations.dnumber = Department.dnumber
and Project.dnum = Department.dnumber;

drop index dnumber;

drop table dept_locations;
drop table project;
drop table department;

drop cluster dept_cluster;