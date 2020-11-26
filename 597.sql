Create table If Not Exists friend_request ( sender_id INT NOT NULL, send_to_id INT NULL, request_date DATE NULL);
Create table If Not Exists request_accepted ( requester_id INT NOT NULL, accepter_id INT NULL, accept_date DATE NULL);
Truncate table friend_request;
insert into friend_request (sender_id, send_to_id, request_date) values ('1', '2', '2016/06/01');
insert into friend_request (sender_id, send_to_id, request_date) values ('1', '3', '2016/06/01');
insert into friend_request (sender_id, send_to_id, request_date) values ('1', '4', '2016/06/01');
insert into friend_request (sender_id, send_to_id, request_date) values ('2', '3', '2016/06/02');
insert into friend_request (sender_id, send_to_id, request_date) values ('3', '4', '2016/06/09');
Truncate table request_accepted;
insert into request_accepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03');
insert into request_accepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09');
insert into request_accepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/10');

/*
Write a query to find the overall acceptance rate of requests rounded to 2 decimals,
which is the number of acceptance divide the number of requests.
 */

/*
| sender_id | send_to_id |request_date|
|-----------|------------|------------|
| 1         | 2          | 2016_06-01 |
| 1         | 3          | 2016_06-01 |
| 1         | 4          | 2016_06-01 |
| 2         | 3          | 2016_06-02 |
| 3         | 4          | 2016-06-09 |

| requester_id | accepter_id |accept_date |
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
| 3            | 4           | 2016-06-10 |


|accept_rate|
|-----------|
|       0.80|
*/

/*
Note:
The accepted requests are not necessarily from the table friend_request.
In this case, you just need to simply count the total accepted requests
(no matter whether they are in the original requests),
and divide it by the number of requests to get the acceptance rate.
It is possible that a sender sends multiple requests to the same receiver,
and a request could be accepted more than once.
In this case, the ‘duplicated’ requests or acceptances are only counted once.
If there is no requests at all, you should return 0.00 as the accept_rate.

*/

/*
Follow-up:
Can you write a query to return the accept rate but for every month?
How about the cumulative accept rate for every day?
*/

SELECT ROUND(COUNT(DISTINCT (requester_id, accepter_id))/COUNT (DISTINCT (sender_id, send_to_id)) :: NUMERIC, 2)
FROM request_accepted, friend_request;

/*
-- MySQL
SELECT ROUND(IFNULL(COUNT(DISTINCT requester_id, accepter_id))/ COUNT(DISINCT sender_id, send_to_id), 0, 2)
FROM friend_request, request_accepted;
*/
