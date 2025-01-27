USE tasks_db;

DROP TABLE transactions;
CREATE TABLE transactions(
	id INT PRIMARY KEY AUTO_INCREMENT,
    shop_id NVARCHAR(10),
    amount DOUBLE,
    trans_date DATETIME
);

INSERT INTO transactions VALUES(1, 'shop1', 1000.00, '2023.01.01 15:17:01');
INSERT INTO transactions VALUES(2, 'shop2', 700.00, '2023.01.01 15:13:02');
INSERT INTO transactions VALUES(3, 'shop2', 330.00, '2023.01.01 15:10:03');

-- select amount for every shop if total amount of all shops > 1000
SELECT t1.shop_id, sum(t1.amount) 
FROM transactions AS t1
WHERE (SELECT sum(amount) FROM transactions AS t2) > 1000
GROUP BY shop_id;
