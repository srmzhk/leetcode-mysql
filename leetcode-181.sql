# 181. Employees Earning More Than Their Managers
# Write a solution to find the employees who earn more than their managers.

USE tests_db;

DROP TABLE IF EXISTS employee2;
CREATE TABLE IF NOT EXISTS employee2 (
	id INT PRIMARY KEY,
    name NVARCHAR(50),
    salary INT,
	managerId INT
);

INSERT INTO employee2 VALUES
	(1, 'Joe', 70000, 3),
    (2, 'Henry', 80000, 4),
    (3, 'Sam', 60000, NULL),
    (4, 'Max', 90000, NULL);

# my own solution
SELECT e1.name as Employee
FROM employee2 AS e1 
WHERE (SELECT salary FROM employee2 AS e2 WHERE e2.id = e1.managerId) < e1.salary;

# additional solution from leetcode with inner join
SELECT e1.name as Employee
FROM employee2 AS e1 
INNER JOIN employee2 AS e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;
