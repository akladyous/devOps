select image_id,
    count(*) as total_comment_by_image
from comments
where image_id < 4
group by image_id
having count(*) > 2;
select user_id,
    count(*) as total_comments_by_user
from comments
where image_id < 5
group by user_id
having count(*) >= 2;
select u.id,
    u.first_name,
    u.last_name,
    paid
from users u
    join orders o on u.id = o.user_id
order by first_name;
select p.name,
    p.price_weight_ratio
from (
        select name,
            price / weight as price_weight_ratio
        from products
    ) as p
where p.price_weight_ratio > 5;

-- SubQueries in FROM Clause
SELECT AVG(orders_count) AS average
FROM (
        SELECT user_id, COUNT(*) AS orders_count
            FROM orders
            GROUP BY user_id
    ) AS p

-- SubQueries in JOIN Clause
SELECT first_name
FROM users
    JOIN (
        SELECT user_id
        FROM orders
        where product_id = 3
    ) AS o ON o.user_id = users.id;

-- this is equivalent to :
SELECT first_name
FROM users
    join orders ON orders.user_id = users.id
where orders.product_id = 3;

-- SubQueries in WHERE Clause
SELECT id
	FROM orders
	WHERE product_id IN (
		SELECT id FROM products WHERE price / weight > 50
	);


SELECT NAME
	FROM products
	WHERE price > (
		SELECT AVG(price) FROM products
	);

