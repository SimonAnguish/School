/* Insert tuples to Department, Dept_locations, and Project only. */

-- Set the mgrssn column to null since we have not created the Employee table.
insert into Department values ('Research', 5, null, '22-May-78'); 
insert into Department values ('Administration', 4, null, '01-Jan-85');
insert into Department values ('Headquarters', 1, null, '19-Jun-71'); 

insert into Dept_locations values (1, 'Houston');
insert into Dept_locations values(4, 'Stafford');
insert into Dept_locations values(5, 'Bellaire');
insert into Dept_locations values(5, 'Sugarland');
insert into Dept_locations values(5, 'Houston');

insert into Project values ('ProductX', 1, 'Bellaire', 5);
insert into Project values ('ProductY', 2, 'Sugarland', 5);
insert into Project values ('ProductZ', 3, 'Houston', 5);
insert into Project values ('Computerization', 10, 'Stafford', 4);
insert into Project values ('Reorganization', 20, 'Houston', 1);
insert into Project values ('Newbenefits', 30, 'Stafford', 4);

commit;