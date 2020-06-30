use juanda;
create table customers(Id int not null, Name varchar(30) not null, Age int not null, Address varchar (200), Salary numeric(30), primary key (Id));
select * from customers;
create table orders(Oid int not null, Date datetime not null, Customerid int not null, Amount numeric (20), primary key (Oid));
insert into customers values(1, "John",32, "New York", 12455);
insert into orders values(105, "20191012",3,2000);
select * from orders;
insert into orders values(111, "20190521101010",4,6300);
delete from orders where Oid=111;

select Id,Name,Age,Amount from customers as c,orders as o where c.id=o.customerid;
create table combined(select Id,Name,Age,Amount from customers ,orders where customers.id=orders.customerid);
select * from combined;

select Id,Name,Amount,Date from customers inner join orders on customers.Id=orders.customerid;
select Id,Name,Amount,Date from customers left join orders on customers.Id=orders.customerid;
select Id,Name,Amount,Date from customers right join orders on customers.Id=orders.customerid;

select Id,Name,Amount,Date from customers left join orders on customers.Id=orders.customerid
union
select Id,Name,Amount,Date from customers right join orders on customers.Id=orders.customerid;

select a.Id, a.Salary from customers as a;
select a.Id, b.Name, a.Salary from customers as a, customers as b where a.Salary<b.Salary;

CREATE TABLE customers_comparison SELECT a.Id AS cust1_id,
    a.Name AS cust1_name,
    b.Id AS cust2_id,
    b.Name AS cust2_name,
    a.Salary AS cust1_salary,
    b.salary AS cust2_salary FROM
    customers AS a,
    customers AS b
WHERE
    a.salary < b.salary;
