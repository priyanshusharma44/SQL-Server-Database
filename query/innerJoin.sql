use dbname;
select * from class;
select * from student;

select * from student inner join class on student.classId=class.classId;

--<> not symbole in sql..

--student ko sabai attributes and class table ko className matrai.
select student.*,className from student inner join class on student.classId=class.classId;

select * from class,student;

select phone,count(*) as phonNumber from student  by phone;

select * from student left outer join class on class.classId=student.classId;
select * from student full outer join class on class.classId=student.classId;

select count(distinct classId) from student; --count only unique classId from student table.

