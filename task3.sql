USE tasks_db;

DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee (
	name VARCHAR(30) PRIMARY KEY,
	city VARCHAR(50)
);

INSERT INTO employee VALUES
('Иванов', 'Москва'),
('Петров', 'Москва'),
('Сидоров', 'Воронеж');

# Вывести уникальный список городов
SELECT DISTINCT(city) FROM employee;

# Вывести количество сотрудников в городах
SELECT city, COUNT(city) AS countNames
FROM employee
GROUP BY city;

# Вывести только те города, в которых количество сотрудников больше 1
SELECT city 
FROM employee 
GROUP BY city 
HAVING count(name) > 0;
