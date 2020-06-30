use juanda;
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
set global local_infile=1;
load data local infile "D:\\Github\\Online Retail.csv" into table stockdata 
character set latin1 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;
select * from stockdata;
alter table stockdata drop Recency;
alter table stockdata add Recency INT GENERATED ALWAYS AS (datediff('2020-06-01',InvoiceDate)) stored;
alter table stockdata add Monetary INT GENERATED ALWAYS AS (Quantity*UnitPrice) stored;
select CustomerID, sum(Monetary), InvoiceDate, Recency from stockdata group by CustomerID order by sum(Monetary) desc;
create table monetary as select CustomerID, InvoiceDate, Recency, sum(Monetary) from stockdata group by CustomerID order by sum(Monetary) desc;


create table recency as select customerID, InvoiceDate, min(Recency) from stockdata group by customerID order by min(recency);
create table combined as select CustomerID, InvoiceDate, min(Recency), count(CustomerID), sum(Monetary) from stockdata group by CustomerID order by count(CustomerID) desc;
create table frequency as select CustomerID, count(CustomerID) from stockdata group by CustomerID order by count(CustomerID) desc;
create table monetary as select CustomerID, sum(Monetary) from stockdata group by CustomerID order by sum(Monetary) desc;

create table m3 as select * from monetary where Monetary>=553 and Monetary<1309;
select max(Recency) from frequency;

select * from f1;
create table customerid_111 select r1.customerID,r1.InvoiceDate,r1.Recency,f1.Frequency,m1.Monetary from m1
inner join r1 on r1.customerID=m1.customerID inner join f1 on f1.CustomerID=m1.customerID;
create table customerid_411 select r4.customerID,r4.InvoiceDate,r4.Recency,f1.Frequency,m1.Monetary from m1
inner join r4 on r4.customerID=m1.customerID inner join f1 on f1.CustomerID=m1.customerID;
