Create table If Not Exists Candidate (id int, Name varchar(255));
Create table If Not Exists Vote (id int, CandidateId int);
Truncate table Candidate;
insert into Candidate (id, Name) values ('1', 'A');
insert into Candidate (id, Name) values ('2', 'B');
insert into Candidate (id, Name) values ('3', 'C');
insert into Candidate (id, Name) values ('4', 'D');
insert into Candidate (id, Name) values ('5', 'E');
Truncate table Vote;
insert into Vote (id, CandidateId) values ('1', '2');
insert into Vote (id, CandidateId) values ('2', '4');
insert into Vote (id, CandidateId) values ('3', '3');
insert into Vote (id, CandidateId) values ('4', '2');
insert into Vote (id, CandidateId) values ('5', '5');
  /*
Write a sql to find the name of the winning candidate, the above example will return the winner B.
+------+
| Name |
+------+
| B    |
+------+
Notes:
You may assume there is no tie, in other words there will be only one winning candidate.
  */
SELECT c.name FROM candidate c
INNER JOIN
(SELECT candidateid, COUNT(candidateid) count
FROM vote
GROUP BY candidateid
ORDER BY count DESC
LIMIT 1) temp1
ON c.id = temp1.candidateid;

SELECT c.name FROM candidate c
WHERE c.id = (SELECT candidateid FROM vote
               GROUP BY candidateid
               ORDER BY COUNT(candidateid) DESC
              LIMIT 1 );

SELECT name FROM (
  SELECT candidateid FROM vote
  GROUP BY candidateid
  ORDER BY COUNT(candidateid) DESC
  LIMIT 1
) AS t
JOIN candidate AS c ON t.candidateid = c.id;
