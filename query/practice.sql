/*
create the following tables under a database named StockDb:
1. ProductCategory(catId, catName)
2. Product(pid, pName, catId)
3. Stock(sid, sdate, stockType, Quantity, rate)
*/

create database StockDb
create table ProductCategory(
	catId int primary key IDENTITY(1,1),
	catName nvarchar(100) not null
);

insert into ProductCategory (catName) values ('Clothes');
insert into ProductCategory (catName) values ('Electronic');
insert into ProductCategory (catName) values ('Kitchen');
insert into ProductCategory (catName) values ('Grocery');

 
create table Product(
	pid int primary key IDENTITY(1,1),
	pName nvarchar(100) not null,
	catId int not null,
	FOREIGN KEY (catId) REFERENCES ProductCategory(catId)
)
insert into Product(pName, catId) values('Gucci shirt', 1);
insert into Product(pName, catId) values('Levis pant', 1);
insert into Product(pName, catId) values('Nike jacket', 1);
insert into Product(pName, catId) values('Goldstar Shoe', 1);

insert into Product(pName, catId) values('LG TV', 2);
insert into Product(pName, catId) values('LG Washing Machine', 2);
insert into Product(pName, catId) values('LG Air Condition', 2),('Asus Laptop',2);

insert into Product(pName, catId) values('Knife', 3),('Kitchen rack',3),('Stove', 3),('Plate',3);

insert into Product(pName, catId) values('Potato', 4);

select * from ProductCategory where catId in(select catId from Product);

create table Stock(
	sid int primary key IDENTITY(1,1),
	sdate datetime not null,
	stockType nvarchar(100) not null,
	quantity int not null,
	rate decimal(10,2) not null
)
alter table Stock add constraint sdate default getDate();


alter table Stock ADD CONSTRAINT stockType check(stockType like 'In' Or stockType like 'Out');

select * from ProductCategory where catId in(select catId from Product group by catId having count(*)>=2);
