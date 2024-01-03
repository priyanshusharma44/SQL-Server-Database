create table Employee(
	empId int primary key,
	empName nvarchar(50) not null unique,
	empSalary decimal(12,2) default(10000) not null,
	empAddress nvarchar(30) null
);
 


create or alter procedure addEmployee(@name as nvarchar(50), @sal as decimal(12,2), @addr as nvarchar(30)='Itahari') as 
begin
	
	insert into Employee(empId,empName,empSalary,empAddress) values(dbo.getNextEmpId(),@name,@sal,@addr);
end



select avg(em
select * from Employee
 
select name from sys.procedures --to check name of procedures present in database

exec addEmployee 'ram',28000,'tarahara';


create function getNextEmpId() returns int as
begin
	declare @id as integer; --creating variable..
	select @id=max(empId) from Employee;
	if @id is null
		begin
			set @id = 1;
		end
	else
		begin
			set @id=@id+1;
		end

	return @id;
end

select dbo.getNextEmpId();



--create a user-defined function getAverageSalary that returns average salary of all employee

create function getAverageSalary() returns decimal as
begin
	declare @avgSalary as decimal;
	select @avgSalary=avg(empSalary) from Employee;

	return @avgSalary;
end

select dbo.getAverageSalary();