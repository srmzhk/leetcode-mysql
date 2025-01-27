# 175. Combine Two Tables
# Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.
# Return the result table in any order.
# The result format is in the following example.

USE tasks_db;

DROP TABLE IF EXISTS people;
CREATE TABLE IF NOT EXISTS people(
	personId INT PRIMARY KEY AUTO_INCREMENT,
    lastName NVARCHAR(50),
    firstName NVARCHAR(50)
);

DROP TABLE IF EXISTS adresses;
CREATE TABLE IF NOT EXISTS adresses(
	addressId  INT PRIMARY KEY AUTO_INCREMENT,
    personId  INT,
    city NVARCHAR(50),
    state NVARCHAR(50)
);

INSERT INTO people VALUES
	(1, 'Wang', 'Allen'),
    (2, 'Alice', 'Bob'),
    (3, 'Tony', 'Man');
    
INSERT INTO adresses VALUES
	(1, 2, 'New York City', 'New York'),	
	(2, 3, 'Leetcode', 'California');
    
SELECT * FROM people;
SELECT * FROM adresses;

SELECT p.firstName, p.lastName, a.city, a.state 
FROM people AS p 
LEFT JOIN
adresses AS a
ON p.personId = a.personId;