# Write your MySQL query statement below
WITH emp as (
SELECT *, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) as rnk FROM Employee
ORDER BY departmentId
)
SELECT d.name as Department, e.name as Employee, e.salary FROM emp e
LEFT JOIN Department d ON e.departmentId = d.id
WHERE e.rnk <=3