CREATE database tasks_db;

USE tasks_db;
DROP TABLE users;
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username NVARCHAR(50)
);

INSERT INTO users VALUES (1, 'Adam');
INSERT INTO users VALUES (2, 'Sam');
INSERT INTO users VALUES (3, 'Todd');

USE tasks_db;
CREATE TABLE sales(
	id INT PRIMARY KEY AUTO_INCREMENT,
	amount DOUBLE,
    user_id INT,
    CONSTRAINT sales_users_fk
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO sales VALUES (1, '1200', 2);
INSERT INTO sales VALUES (2, '2000', 3);

-- select only users who make some sales
SELECT * FROM users as u right join sales as s ON u.id = s.user_id;

 