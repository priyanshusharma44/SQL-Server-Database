create login Test with password='12345';
--if forget password...
alter login Test with password='11111';


use Test;

create user TestUser for login Test;

select * from sys.tables;

--give (select query) access the table named EmpTable...
grant select on EmpTable to TestUser;

grant all on EmpTable to TestUser;

--give all permission except delete
revoke delete on EmpTable to TestUser;
revoke all on EmpTable to TestUser;

--to give permission to user who can give others user grant permission
grant select, insert on EmpTable to TestUser with grant option;
--to remove such permission from all
revoke select, insert on EmpTable to TestUser cascade;

select * from EmpTable

delete from EmpTable where empId=1;

insert into EmpTable(empId,empName, salary) values(6,'saroj', 460000);


--===================================================================================
create login Asmita with password = '12345';
create user asmitaUser for login Asmita;
grant insert on EmpTable to asmitaUser;

