-- Dep, Emp, Salary, rank
WITH sub AS
(SELECT
    d.Name dept,
    e.Name emp,
    e.Salary,
    rank() OVER (PARTITION BY d.Name ORDER BY e.SALARY DESC) rk
    FROM Employee e
    JOIN Department d
    ON (e.DepartmentId = d.Id))
SELECT sub.dept Department,
sub.emp Employee,
sub.Salary Salary 
FROM  sub
WHERE sub.rk = 1