Create table If Not Exists my_numbers (num int);
Truncate table my_numbers;
insert into my_numbers (num) values ('8');
insert into my_numbers (num) values ('8');
insert into my_numbers (num) values ('3');
insert into my_numbers (num) values ('3');
insert into my_numbers (num) values ('1');
insert into my_numbers (num) values ('4');
insert into my_numbers (num) values ('5');
insert into my_numbers (num) values ('6');

/*
Can you write a SQL query to find the biggest number, which only appears once.

+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 |
For the sample data above, your query should return the following result:
+---+
|num|
+---+
| 6 |
Note:
If there is no such number, just output null.
*/

SELECT CASE WHEN COUNT(*)=1 THEN num
            ELSE NULL
            END AS num
FROM my_numbers
GROUP BY num
HAVING COUNT(*)=1
ORDER BY num DESC
LIMIT 1;

/* mySQL
SELECT IF(COUNT(*)=1, num, null) AS num
FROM my_numbers
GROUP BY num
ORDER BY num DESC
LIMIT 1;
*/
