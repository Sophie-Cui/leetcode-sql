Create table If Not Exists Activity (player_id int, device_id int, event_date date, games_played int);
Truncate table Activity;
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5');
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6');
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0');
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5');
  /*
Write an SQL query that reports the fraction of players that logged in again on the day
after the day they first logged in, rounded to 2 decimal places. In other words,
you need to count the number of players that logged in for at least two consecutive days
starting from their first login date, then divide that number by the total number of players.
Result table:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33
  */
WITH temp1 AS (
SELECT player_id, MIN(event_date) min
FROM activity
GROUP BY player_id )

SELECT ROUND(COUNT(DISTINCT a.player_id)::NUMERIC /(SELECT COUNT(DISTINCT player_id)::NUMERIC FROM activity), 2) fraction FROM activity a
JOIN temp1
ON a.player_id  = temp1.player_id AND a.event_date = temp1.min + 1;

/*MySQL
WITH temp1 AS (
SELECT player_id, MIN(event_date) min
FROM activity
GROUP BY player_id )

SELECT ROUND(COUNT(DISTINCT a.player_id) /(SELECT COUNT(DISTINCT player_id) FROM activity), 2) fraction FROM activity a
JOIN temp1
ON a.player_id  = temp1.player_id AND a.event_date = temp1.min + 1;
*/
