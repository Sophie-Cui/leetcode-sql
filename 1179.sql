Create table If Not Exists Department (id int, revenue int, month varchar(5));
Truncate table Department;
insert into Department (id, revenue, month) values ('1', '8000', 'Jan');
insert into Department (id, revenue, month) values ('2', '9000', 'Jan');
insert into Department (id, revenue, month) values ('3', '10000', 'Feb');
insert into Department (id, revenue, month) values ('1', '7000', 'Feb');
insert into Department (id, revenue, month) values ('1', '6000', 'Mar');
  /*
Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.
Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+
Result table:
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
Note that the result table has 13 columns (1 for the department id + 12 for the months).
  */

  select id, 
  	sum(case when month = 'Jan' then revenue else null end) as Jan_Revenue,
  	sum(case when month = 'Feb' then revenue else null end) as Feb_Revenue,
  	sum(case when month = 'Mar' then revenue else null end) as Mar_Revenue,
  	sum(case when month = 'Apr' then revenue else null end) as Apr_Revenue,
  	sum(case when month = 'May' then revenue else null end) as May_Revenue,
  	sum(case when month = 'Jun' then revenue else null end) as Jun_Revenue,
  	sum(case when month = 'Jul' then revenue else null end) as Jul_Revenue,
  	sum(case when month = 'Aug' then revenue else null end) as Aug_Revenue,
  	sum(case when month = 'Sep' then revenue else null end) as Sep_Revenue,
  	sum(case when month = 'Oct' then revenue else null end) as Oct_Revenue,
  	sum(case when month = 'Nov' then revenue else null end) as Nov_Revenue,
  	sum(case when month = 'Dec' then revenue else null end) as Dec_Revenue
  from department
  group by id
  order by id;
