use dbname;
select * from student;
alter table student add phone varchar(20);
update student set phone = '9812384199';

select name from sys.tables;

--find the list of student having no phone number.
select * from student where phone is null; --cannot compare with >,=,<.
select count(phone) from student;
select * from student order by classId desc, stdName asc, rollNo;

--copy all the data and column from student to newStudent..
select * into newStudent from student;

--copy all the column only from student to newStudent..
select * into newStudent from student where 1=0;

drop table newStudent;

--inserting data from student to new student
insert into newStudent(stdName, rollNo, classId, dueAmount, phone)
select stdName, rollNo, classId, dueAmount,phone from student;
select * from newStudent;

--select student where classId = 1 and 2.....
select * from student where classId In (1,2);
--can also insert another query inside In() which is called as subQuery....
select * from student where classId In (select classId from class);

--select student name and phone if phone is null it display 'NA'....
select stdName, (case when phone is null then 'NA' else phone end) from student;

alter table student add sex bit;

update student set sex=1;

select stdName, case when sex=1 then 'Male' else 'Female' end as Sex from student;

