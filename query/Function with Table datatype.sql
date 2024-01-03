--create table-valued function that returns a table as return value.

create function getEmpDetail(@sal as decimal) returns Table as 
	return select * from Employee where empSalary=@sal;
	--use the table valued function as parameterize view
select * from dbo.getEmpDetail(12000);

--concept of table variable
declare @myTable Table(id integer, eName nvarchar(50));
insert into @myTable select empId, empName from employee;
select * from @myTable;

create or alter function getNameList() returns @nameList Table(empName nvarchar(50)) as 
begin
	insert into @nameList select empName from Employee;
	return;
end

select * from dbo.getNameList();