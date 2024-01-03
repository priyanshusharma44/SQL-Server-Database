select * from Employee;

begin transaction;
select * from Employee;
DELETE FROM Employee;
select * from Employee;
--rollback; --==============>	undo the transaction.....
commit; --==============> excute the task
select * from Employee;