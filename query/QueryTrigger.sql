select name from sys.databases;
use bca4

select * from employee;
select * from employeelog;

select name from sys.triggers;


insert into Employee values(1,'Hari',12000,'Itahari');

create table EmployeeLog(
	logId int primary key identity(1,1),
	empId int not null,
	empName nvarchar(50) not null,
	empSalary decimal(12,2) not null,
	empAddress nvarchar(30),
	actionDate datetime not null default getdate(),
	actionName nvarchar(20) check(actionName like 'Inserted' or
	actionName like 'Delete' or actionName like 'Update')
)

--single triggering
create trigger InsertEmployeeTrigger on Employee after Insert as 
begin
	insert into EmployeeLog(empId, empName, empSalary, empAddress, actionName)
	select empId, empName, empSalary, empAddress, 'Inserted' from inserted
	
end

create trigger DeleteEmployeeTrigger on Employee after Delete as 
begin
	insert into EmployeeLog(empId, empName, empSalary, empAddress, actionName)
	select empId, empName, empSalary, empAddress, 'Delete' from deleted;
	
end

delete from Employee

create trigger UpdateEmployeeTrigger on Employee after Update as 
begin
	insert into EmployeeLog(empId, empName, empSalary, empAddress, actionName)
	select empId, empName, empSalary, empAddress, 'update' from deleted
	insert into EmployeeLog(empId, empName, empSalary, empAddress, actionName)
	select empId, empName, empSalary, empAddress, 'update' from inserted
	
end

update Employee set empSalary=22000 where empId=1;

--multiple trigger
create trigger EmployeeTrigger on Employee after insert,delete,Update as 
begin
	set nocount on;
	insert into EmployeeLog(empId, empName, empSalary, empAddress, actionName)
	(select empId, empName, empSalary, empAddress, 'Delete' from deleted 
	union all
	(select empId, empName, empSalary, empAddress, 'Inserted' from inserted))
	
end

--disableing trigger  (to enable it replace disable with enable
disable trigger InsertEmployeeTrigger on Employee;
disable trigger DeleteEmployeeTrigger on Employee;
disable trigger UpdateEmployeeTrigger on Employee;