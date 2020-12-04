CREATE TABLE If Not Exists point (x INT NOT NULL);
Truncate table point;
insert into point (x) values ('-1');
insert into point (x) values ('0');
insert into point (x) values ('2');
CREATE INDEX x_UNIQUE ON point(x ASC);

/*
Write a query to find the shortest distance between two points in these points.


| x   |
|-----|
| -1  |
| 0   |
| 2   |


The shortest distance is '1' obviously, which is from point '-1' to '0'. So the output is as below:


| shortest|
|---------|
| 1       |


Note: Every point is unique, which means there is no duplicates in table point.
*/
SELECT MIN(ABS(a.x - b.x)) shortest
FROM point a, point b
WHERE a.x > b.x;
