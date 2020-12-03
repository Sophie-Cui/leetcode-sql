Create table If Not Exists cinema (seat_id serial primary key, free bool);
Truncate table cinema;
insert into cinema (seat_id, free) values ('1', '1');
insert into cinema (seat_id, free) values ('2', '0');
insert into cinema (seat_id, free) values ('3', '1');
insert into cinema (seat_id, free) values ('4', '1');
insert into cinema (seat_id, free) values ('5', '1');

/*
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?
| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |


Your query should return the following result for the sample case above.


| seat_id |
|---------|
| 3       |
| 4       |
| 5       |
Note:
The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.).
Consecutive available seats are more than 2(inclusive) seats consecutively available.
*/

SELECT a.seat_id seat_id
FROM cinema a, cinema b
WHERE (a.seat_id = b.seat_id + 1) AND (a.free = True) AND (b.free = True)
UNION
SELECT a.seat_id seat_id
FROM cinema a, cinema b
WHERE (a.seat_id = b.seat_id - 1) AND (a.free = True) AND (b.free = True)
ORDER BY 1;
