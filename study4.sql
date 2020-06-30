select * from orders;
alter table orders add(recent datetime);
ALTER TABLE orders ADD (today TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
select datediff('2020-06-05','2020-06-03');
alter table orders drop Recency;
alter TABLE orders set recent INT GENERATED ALWAYS AS (Amount*2) STORED;
alter table orders add Recency INT GENERATED ALWAYS AS (datediff(today,Date)) stored;
