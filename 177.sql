Create table If Not Exists Employee (id int, salary int);
Truncate table Employee;
insert into Employee (id, salary) values ('1', '100');
insert into Employee (id, salary) values ('2', '200');
insert into Employee (id, salary) values ('3', '300');

/*
Write a SQL query to get the nth highest salary from the Employee table.
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table,
the nth highest salary where n = 2 is 200.
If there is no nth highest salary,
then the query should return null.
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
*/
create or replace function getnth(n int)
returns int as $ranks$
declare
	ranks int;
begin
	select salary into ranks from employee
	group by salary
	order by salary desc
	limit 1 offset n-1;
	return ranks;
end;
$ranks$ LANGUAGE plpgsql;

select getnth(2);

/*mySQL
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M = N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary
      FROM Employee
      ORDER BY Salary DESC
      LIMIT M, 1
  );
END

*/
