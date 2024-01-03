create table Employee(
	empId int,
	empName nvarchar(50) not null,
	empAddress nvarchar(30) default('Itahari'),
	joinDate date default getdate(),
	salary decimal(12,2) check (salary between 10000 and 500000),
	managerId int,
	primary key(empId),
	foreign key(managerId) references Employee(empId) --self join
);
insert into Employee(empId, empName, empAddress,salary) values(1,'harimaya', 'hile',45000);

insert into Employee(empId, empName, managerId,salary) values(2,'laxmibhadur', 1,45000);

insert into Employee(empId, empName, managerId,salary) values(4,'sitaprasad', null,42000);

insert into Employee(empId, empName, joinDate, managerId,salary) values(5,'subashMayadevi','2022-01-03', 4,40000);

select * from Employee

select count(*) as NumOfEmp from employee where managerId is null;
select count(*) as NumofManager from employee where managerId is not null;

select * from Employee as emp, Employee as mgr where emp.managerId=mgr.empId;

select emp.empname,mgr.empname from Employee as emp left join employee as mgr on emp.managerid=mgr.empid;

select empname,(select empname from Employee where empid=Emp.ManagerId) as ManagerName from Employee as Emp;