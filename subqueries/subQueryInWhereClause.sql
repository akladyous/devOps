SELECT id
FROM orders
WHERE product_id IN
		(SELECT id
			FROM products
			WHERE price / weight > 50 );


SELECT name
FROM products
WHERE price >
		(SELECT avg(price)
			FROM products);


SELECT name,
	department
FROM products
WHERE department not in
		(SELECT department
			WHERE price < 100 );


SELECT name,
	department,
	price
FROM products
WHERE price > ALL
		(SELECT price
			FROM products
			WHERE department = 'industrial' );


SELECT name,
	department,
	price
FROM products
WHERE price > SOME
		(SELECT price
			FROM products
			WHERE department = 'Industrial' );


SELECT name,
	department,
	price
FROM products AS p1
WHERE p1.price =
		(SELECT max(price)
			FROM products AS p2
			WHERE p2.department = p1.department );


SELECT p.name,
	(SELECT count(*)
		FROM orders AS o
		WHERE o.product_id = p.id )
FROM products AS p;