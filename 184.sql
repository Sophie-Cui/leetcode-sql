Create table If Not Exists Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists Department (Id int, Name varchar(255));
Truncate table Employee;
insert into Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '70000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('2', 'Jim', '90000', '1');
insert into Employee (Id, Name, Salary, DepartmentId) values ('3', 'Henry', '80000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('4', 'Sam', '60000', '2');
insert into Employee (Id, Name, Salary, DepartmentId) values ('5', 'Max', '90000', '1');
Truncate table Department;
insert into Department (Id, Name) values ('1', 'IT');
insert into Department (Id, Name) values ('2', 'Sales');
/*
The Employee table holds all employees.
Every employee has an Id, a salary, and there is also a column for the department Id.
Write a SQL query to find employees who have the highest salary in each of the departments.
For the above tables, your SQL query should return the following rows (order of rows does not matter).
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
Explanation:
Max and Jim both have the highest salary in the IT department and
Henry has the highest salary in the Sales department.
*/
SELECT d.name Department, e2.name Employee, e2.salary Salary FROM employee e2, (SELECT e1.departmentid, MAX(e1.salary) max
FROM employee e1
GROUP BY 1) t, department d
WHERE e2.departmentid = t.departmentid AND e2.salary = t.max  AND d.id = e2.departmentid;

SELECT d.name Department, e.name Employee, e.salary Salry
FROM Employee e, department d
WHERE e.departmentid = d.id
AND NOT EXISTS
(SELECT 1 FROM employee e2
  WHERE e2.salary > e.salary AND e.departmentid = e2.departmentid);

SELECT d.name department, e1.name Employee, e1.salary salary
FROM employee e1, department d
WHERE e1.departmentid = d.id AND (departmentid, salary) IN (SELECT departmentid, MAX(salary) max
                                                            FROM Employee
                                                            GROUP BY 1);
