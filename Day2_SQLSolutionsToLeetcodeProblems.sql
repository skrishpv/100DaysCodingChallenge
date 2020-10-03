1. 2nd highest salary problem: https://leetcode.com/problems/second-highest-salary/
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee)

2. Duplicate emails: https://leetcode.com/problems/duplicate-emails/
SELECT Email
FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1

3. Classes with more than 5 students: https://leetcode.com/problems/classes-more-than-5-students/
SELECT Class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT(student)) >= 5

4. Rising temperature: https://leetcode.com/problems/rising-temperature/
SELECT DISTINCT a.Id
FROM Weather a, Weather b
WHERE a.Temperature > b.Temperature
AND DATEDIFF(day, a.recorddate, b.recorddate) = -1

5. Department top 3 salaries: https://leetcode.com/problems/department-top-three-salaries/
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Department d, Employee e
WHERE e.DepartmentId = d.Id
AND (
SELECT COUNT(DISTINCT Salary)
FROM Employee
WHERE DepartmentId = d.Id
AND Salary > e.Salary
) <3
ORDER BY Department
