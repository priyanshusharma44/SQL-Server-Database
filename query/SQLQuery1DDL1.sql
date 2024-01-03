select name from sys.databases;
use testdb;
create table Test2(
TestId int primary key identity(1,1),
TestDescription nvarchar(50) ,
TestedBy nvarchar(50),

);
insert into Test2(TestDescription,TestedBy)
values('Testing89','Raameshos')


select * from Test2
delete from Test2;

update test2 set TestedBy='Ram';
alter table Test drop column TestDescription

alter table Test add TestedBy nvarchar(50)

alter table Test alter column TestedBy nvarchar(50) not null;


select count (*) from test2;
--to remove duplicate and only select one
select count (distinct testedBy) from test2;
select distinct TestedBy from Test2;
update Test2 set TestedBy 'Ram' where TestId>1;

--to give heading froo count
select count (distinct testedBy) as Tester_count from Test2;

--to change name
execute sp_rename 'Test2', 'Test23';
--toc change column 
execute sp_rename 'Test2.TestedByy', 'TestedBy','COLUMN';



--left to add date ... i have removed the column date from the table 

--change to next table if only table in need to copy 
select * into newTest from Test2 where testid=0;
--if to copy data 
select * into newTest2 from Test2 

select * from newTest2

-- to get data of highest id record 
select top 50 percent * from test2;