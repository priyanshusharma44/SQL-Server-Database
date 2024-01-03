use test;
select * from EmpTable;

--problem1: find the details of the employee having largest salary.
select max(salary) from Employee
select * from Employee where salary>=all(select salary from employee); --both are same
select * from Employee where salary=(select max(salary) from Employee); --both are same

--Problem2: find the details of all employee having salary greater than average salary of all employee
select avg(salary) from Employee
select * from employee where salary > (select avg(salary) from Employee);

--Problem3: find the details of all employee whose salary is greater than any other member in the company
select * from Employee where salary > any(select salary from employee);

exec sp_rename 'employee','EmpTable'; --renaming table name

exec sp_rename 'EmpTable.managerId','MgrId','column';

--if there is any student in any classes then it returned that particular classes :-
--select * from class where exists(select * from student where classid=Class.classid);