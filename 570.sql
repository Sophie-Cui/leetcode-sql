Create table If Not Exists Employee (Id int, Name varchar(255), Department varchar(255), ManagerId int);
Truncate table Employee;
insert into Employee (Id, Name, Department, ManagerId) values ('101', 'John', 'A', NULL);
insert into Employee (Id, Name, Department, ManagerId) values ('102', 'Dan', 'A', '101');
insert into Employee (Id, Name, Department, ManagerId) values ('103', 'James', 'A', '101');
insert into Employee (Id, Name, Department, ManagerId) values ('104', 'Amy', 'A', '101');
insert into Employee (Id, Name, Department, ManagerId) values ('105', 'Anne', 'A', '101');
insert into Employee (Id, Name, Department, ManagerId) values ('106', 'Ron', 'B', '101');
  /*
Given the Employee table, write a SQL query that finds out managers with at least 5 direct report.
For the above table, your SQL query should return:
+-------+
| Name  |
+-------+
| John  |
+-------+
Note:
No one would report to himself.
  */
SELECT e1.name FROM employee e1
INNER JOIN
(SELECT ManagerId, COUNT(Id)
FROM employee
GROUP BY 1
HAVING COUNT(Id) >= 5) e2
ON e2.ManagerId = e1.Id;

SELECT name FROM employee
WHERE id IN (SELECT managerid FROM employee
             GROUP BY managerid
             HAVING COUNT(managerid) > 4);

SELECT e1.name FROM employee e1
JOIN employee e2
ON e1.id = e2.managerid
GROUP BY e1.name
HAVING COUNT(e1.name) > 4;
