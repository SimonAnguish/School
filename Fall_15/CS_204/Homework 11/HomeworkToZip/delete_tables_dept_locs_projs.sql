/* Drops the tables Department, Dept_locations, and Project. */

alter table Dept_locations drop constraint dept_locs_pmk;

alter table Dept_locations drop column dnumber;

alter table Project drop column dnum;

/* Drops the actual tables */

drop table Dept_locations;

drop table Project;

drop table Department;