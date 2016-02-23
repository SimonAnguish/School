/* Create the tables Department, Dept_locations, and Project only. */

create table Department (
  dname varchar(20),
  dnumber decimal(2) primary key,
  mgrssn decimal(9), -- omit the foreign key constraint to Employee.ssn.
  mgrstartdate date
);

create table Dept_locations (
  dnumber decimal(2) references Department(dnumber),
  dlocation varchar(20),
  constraint dept_locs_pmk primary key (dnumber, dlocation)
);

create table Project (
  pname varchar(20),
  pnumber decimal(2) primary key,
  plocation varchar(20),
  dnum decimal(2) references Department(dnumber)
);
