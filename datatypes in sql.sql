create table numbers(
id serial,
age smallint,
price numeric(4,2),
rating real
);

insert into numbers(age,price,rating)
values(23,23.45,12.567);
select * from numbers;



CREATE TABLE strings(
code char(5),
email varchar(100),
bio text
);

insert into strings
values ('23vb4','sakshi@gmail.com','Writing a captivating bio comes down to knowing exactly where it will live and what you want to achieve');

select * from strings;
