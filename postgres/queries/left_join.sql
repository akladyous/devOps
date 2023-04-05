select * from comments where user_id = null;

select u.id, u.username, c.contents from users u
inner join comments c on u.id = c.user_id;

select u.id, u.username from users u
left join comments c on u.id = c.user_id
where c.contents is null
group by u.id;

select count(u.id) from users u
left join comments c on u.id = c.user_id
where c.contents is null;


select price, count(*) as 'total products per price' from products group by price;