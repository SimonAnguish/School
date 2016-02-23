create table merged_table (
  dname varchar(20),
  dnumber decimal(2),
  mgrssn decimal(9),
  mgrstartdate date,
  dlocation varchar(20),
  pname varchar(20),
  pnumber decimal(2),
  plocation varchar(20),
  constraint merged_pmk primary key (
    dnumber, dlocation, pnumber
  )
);

start create_tables_dept_locs_projs.sql;
start insert_tuples_dept_locs_projs.sql;

insert into merged_table (
  dname,
  dnumber,
  mgrssn,
  mgrstartdate,
  dlocation,
  pname,
  pnumber,
  plocation
)
select 
  dname,
  department.dnumber, 
  mgrssn, 
  mgrstartdate, 
  dlocation, 
  pname, 
  pnumber, 
  plocation
from department, dept_locations, project
where department.dnumber = dept_locations.dnumber
and project.dnum = department.dnumber;

start delete_tables_dept_locs_projs.sql;

create index merged_index on merged_table (dnumber);

commit;

-- (1)
select distinct dnumber, dname, mgrssn, mgrstartdate
from merged_table
order by dnumber;

select distinct dnumber, dlocation
from merged_table;

select distinct pnumber, pname, plocation, dnumber as dnum
from merged_table
order by pnumber;

-- (2)
select distinct plocation, pname
from merged_table
where dname = 'Administration';

drop index merged_index;

drop table merged_table;

commit;