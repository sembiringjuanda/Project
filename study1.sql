CREATE DATABASE juanda;
use juanda;
create table employee (Name varchar(20), Email varchar(50));
create table students (Name varchar(10), Email varchar(20), City varchar(10), DOB Date,
Salary numeric(20));
alter table students add(address varchar(20));
create table emp (Name varchar(20), Email varchar(20));
drop table emp;
alter table students drop column City;
alter table students rename column DOB to DateofBirth;
insert into students(Name,Email,Salary,address)
values("Kelly","kelly@bootup.ai",26566,"Singapore");
select * from students;
alter table students add student_id int not null primary key auto_increment;
update students set DateofBirth = '2000-01-10' where student_id=1;
update students set Name = 'Paul', Email = 'paul@bootup.ai', DateofBirth = '1990-05-15' where student_id=1;
update students set Name = 'Juanda', Email = 'juanda@bootup.ai', DateofBirth = '1998-09-25' where student_id=2;
delete from students where student_id=10;
select * from students where address = 'Jakarta';
select * from students limit 3;
select * from students order by DateofBirth;
select address,sum(Salary),Name from students group by address;
select address,Name,sum(Salary) from students group by address order by sum(Salary) desc;
delete from students where DateofBirth = NULL;

CREATE TABLE stockdata (
    InvoiceNo VARCHAR(10),
    StockCode VARCHAR(20),
    Description VARCHAR(100),
    Quantity NUMERIC(10),
    InvoiceDate DATETIME,
    UnitPrice NUMERIC(20),
    CustomerID VARCHAR(10),
    Country VARCHAR(20)
);
show global variables like "local_infile";
set global local_infile=1;orders
select * from stockdata;
load data local infile "D:\\Github\\Bootup-onemonth\\Online Retail.csv" into table stockdata 
character set latin1 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

select count(*) from stockdata;
select avg(UnitPrice), avg(Quantity) from stockdata;
select sum(UnitPrice), sum(Quantity) from stockdata;
select min(UnitPrice), min(Quantity) from stockdata;
select max(UnitPrice), max(Quantity) from stockdata;
