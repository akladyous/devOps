SELECT name,
	weight,
	greatest(30,
		2 * weight)
FROM products;


SELECT name,
	price,
	least(price * 0.5,
		400)
FROM products;