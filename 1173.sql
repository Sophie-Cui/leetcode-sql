Create table If Not Exists Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date);
Truncate table Delivery;
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '5', '2019-08-02', '2019-08-02');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-11');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-26');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '4', '2019-08-21', '2019-08-22');
insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13');

/*
If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.
Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.
Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 5           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-11                  |
| 4           | 3           | 2019-08-24 | 2019-08-26                  |
| 5           | 4           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
+-------------+-------------+------------+-----------------------------+
Result table:
+----------------------+
| immediate_percentage |
+----------------------+
| 33.33                |
+----------------------+
The orders with delivery id 2 and 3 are immediate while the others are scheduled.
*/
SELECT ROUND(100*AVG((order_date = customer_pref_delivery_date)::INT), 2) immediate_percentage
FROM delivery;

/*mySQL
SELECT ROUND(100*AVG(order_date = customer_pref_delivery_date), 2) immediate_percentage
FROM delivery;
*/
