create table students(
stu_id int,
name char(50),
age int,
grade char(1)
);

insert into students(stu_id,name,age,grade)
values (1,'Sakshi',21,'A'),
		(2,'Khushi',21,'A');


select * from student

select name from students where name='Sakshi';

update students set age=22 where name ='Sakshi';


delete from students where name ='Sakshi';

-- to retrieve all students information
select * from students;  