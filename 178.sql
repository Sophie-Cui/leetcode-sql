Create table If Not Exists Scores (Id int, Score DECIMAL(3,2));
Truncate table Scores;
insert into Scores (Id, Score) values ('1', '3.5');
insert into Scores (Id, Score) values ('2', '3.65');
insert into Scores (Id, Score) values ('3', '4.0');
insert into Scores (Id, Score) values ('4', '3.85');
insert into Scores (Id, Score) values ('5', '4.0');
insert into Scores (Id, Score) values ('6', '3.65');

  /*
Write a SQL query to rank scores.
If there is a tie between two scores, both should have the same ranking.
Note that after a tie, the next ranking number should be the next consecutive integer value.
In other words, there should be no "holes" between ranks.
For example, given the above Scores table,
your query should generate the following report (order by highest score):
+-------+---------+
| score | Rank    |
+-------+---------+
| 4.00  | 1       |
| 4.00  | 1       |
| 3.85  | 2       |
| 3.65  | 3       |
| 3.65  | 3       |
| 3.50  | 4       |
+-------+---------+
  */
SELECT score, (SELECT COUNT(DISTINCT score) FROM scores WHERE score >= s.score) rank
FROM scores s
ORDER BY score DESC;

SELECT Score, DENSE_RANK() OVER(ORDER BY Score DESC) AS Rank
FROM Scores
ORDER BY Rank;

SELECT S.Score, COUNT(S2.Score) AS Rank FROM Scores S,
(SELECT DISTINCT Score FROM Scores) S2
WHERE S.Score<=S2.Score
GROUP BY S.Id
ORDER BY S.Score DESC;

/*MySQL
Select Score,
       Dense_rank() Over (Order By Score Desc) `Rank`
From Scores
*/
