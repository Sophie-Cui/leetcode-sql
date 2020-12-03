Create table If Not Exists orders (order_number int, customer_number int, order_date date, required_date date, shipped_date date, status char(15), comment char(200), PRIMARY KEY(order_number));
Truncate table orders;
insert into orders (order_number, customer_number) values ('1', '1');
insert into orders (order_number, customer_number) values ('2', '2');
insert into orders (order_number, customer_number) values ('3', '3');
insert into orders (order_number, customer_number) values ('4', '3');

/*
The customer with number '3' has two orders, which is greater than either customer '1' or '2' because each of them  only has one order.
So the result is customer_number '3'.
| customer_number |
|-----------------|
| 3               |
*/

SELECT customer_number FROM orders
GROUP BY 1
ORDER BY COUNT(*) DESC
LIMIT 1;
