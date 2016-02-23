CREATE TABLE Orders (
  orderdate date NOT NULL,
  itemno int NOT NULL,
  itemname varchar(10),
  quantity int,
  CONSTRAINT pmk_orders PRIMARY KEY (orderdate, itemno)
);

insert into Orders values ('01-Nov-2011', 1, 'Axle',  10);
insert into Orders values ('01-Nov-2011', 2, 'Rotor', 20);
insert into Orders values ('01-Nov-2011', 3, 'Shaft',  5);

insert into Orders values ('02-Nov-2011', 1, 'Axle',  30);
insert into Orders values ('02-Nov-2011', 3, 'Shaft',  5);

insert into Orders values ('03-Nov-2011', 3, 'Shaft',  5);

insert into Orders values ('04-Nov-2011', 3, 'Shaft',  5);

insert into Orders values ('05-Nov-2011', 3, 'Shaft',  5);
insert into Orders values ('05-Nov-2011', 4, 'Rim',    4);

insert into Orders values ('06-Nov-2011', 3, 'Shaft',  5);

insert into Orders values ('07-Nov-2011', 3, 'Shaft',  5);
insert into Orders values ('07-Nov-2011', 1, 'Axle',  15);

insert into Orders values ('08-Nov-2011', 2, 'Rotor', 10);