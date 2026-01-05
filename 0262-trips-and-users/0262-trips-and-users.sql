# Write your MySQL query statement below
SELECT 
    request_at AS Day,
    COALESCE(ROUND(SUM(CASE WHEN t.status = 'cancelled_by_driver' OR t.status = 'cancelled_by_client' THEN 1 ELSE 0 END)/Count(client_id),2),0) as 'Cancellation Rate'
FROM Trips t
JOIN Users u ON t.client_id = u.users_id AND u.banned = 'NO'
JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'NO'
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at