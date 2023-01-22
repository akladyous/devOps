select * from users;
update users
set email = 'will.smith@gmail.com'
where id = 1;

select url, first_name
from photos join users on users.id = photos.user_id;

insert into photos (url, user_id)
values ('htt://photo.io', null);

select user_id, count(user_id) from comments group by user_id;

select first_name, count(c.user_id) as total_comments, (
	select count(user_id) from photos 
    where c.user_id = photos.user_id
    group by user_id
) as total_photos
from comments as c
join users as u on u.id = c.user_id
group by c.user_id
order by c.user_id;

select photo_id, count(*)  as total_photos
from comments 
where photo_id > 4
group by photo_id having total_photos > 2;

select user_id, count(*) as total_comments
from comments where photo_id <= 2
group by user_id having total_comments >= 1;

select name, price 
from products p
where price > (
	select max(price) from products where department = 'home'
);

select name, p.ratio
from (
	select name, round(price/weight, 2) as ratio from products
) as p where p.ratio > 1;
-- ---------------------------------------------------------------- 
select avg(user_id) from orders order by user_id;
select avg(order_count)
from (
	select user_id, count(*) as order_count
	from orders
	group by user_id
) as o;

select user_id, o.order_count, o.order_count / (
	select count(*) from orders
) as order_count_avg
from (
	select user_id, count(*) as order_count 
	from orders 
	group by user_id	
) as o
group by user_id;
-- ---------------------------------------------------------------- 
select name, price
from products
where price > (
	select avg(price) from products
);
select avg(price) from products;
-- ---------------------------------------------------------------- 
select name, department, price
from products
where price > all (
	select max(price) from products where department = 'Home'
);
-- ---------------------------------------------------------------- 
explain  select p1.id, p1.name, (
	select count(*) from orders o1 
    where o1.product_id = p1.id
    group by product_id 
) As num_orders
from products as p1 ;
-- ---------------------------------------------------------------- 
select price/weight from products;

select adddate('2022-10-8', interval 1 day);
select truncate(234.2323, length( cast(234.2323 as char) ) -1);
select truncate(234.1234, 2);
SELECT CONCAT_WS(' ,','First name','Second name','Last Name');
SELECT ELT(1, 'Aa', 'Bb', 'Cc', 'Dd');
select cast(23.343434 as char);
select length(cast(truncate(23.1005,0) as char )) ;
show character set;
SELECT @@global.time_zone, @@session.time_zone;
SHOW DATABASES;
-- ---------------------------------------------------------------- 
select p.name, o.purchased_at
from products p
join orders o on o.product_id = p.id
where o.purchased_at between (CURDATE() - INTERVAL 1 week ) and CURDATE();

select * from orders where purchased_at between (CURDATE() - INTERVAL 1 MONTH ) and CURDATE();
select * from orders;
select CURDATE() - INTERVAL 1 MONTH ;
-- ---------------------------------------------------------------- 
select WEEKDAY(NOW()) + 1;
select dayofmonth('2022-10-09');
select dayofweek('2022-10-09');
-- ---------------------------------------------------------------- 
SET lc_time_names = 'en_US';
select count(*) from orders where user_id = 1;

(select * from products order by price desc limit 5)
union
(select * from products order by price / weight desc limit 5);

select avg(id) from users;
select * from comments;
select * from photos;
select * from products;
select * from orders;
select count(*) from orders;

insert into users (first_name, last_name, email, status, created_at, updated_at)
values
('paolo', 'rossi', 'paolo.rossi@gmail.com', true, current_timestamp(), current_timestamp());

select adddate('2022-10-08', interval 1 month);
select date_format("2022-10-08", "%Y-%b-%d");
select curdate();
select dayname(curdate());
SELECT MAKEDATE(2022, 30);