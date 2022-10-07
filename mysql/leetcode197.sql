-- DROP TABLE IF EXISTS dates;
-- CREATE TABLE dates (
--     id SERIAL PRIMARY KEY,
-- 	record_date TIMESTAMP,
-- 	temprature int
-- );
-- INSERT INTO dates (record_date, temprature)
-- VALUES
-- ('06-20-2022 01:00:00 am', 10),
-- ('06-21-2022 02:00:00 pm', 25),
-- ('06-22-2022 03:00:00 pm', 15),
-- ('06-23-2022 04:00:00 pm ', 30);
-- select * from dates;

-- select current_date - 2;
-- select current_date - timestamp '1974-07-10'
-- select age(current_date, '1974-07-10')
-- select extract(day from  record_date::timestamp) from dates where id=1;
-- select * from dates;

-- select * from crossJoin t1 cross join crossJoin t2;
-- select * from crossJoin c1  join crossJoin c2 on c1.id = c2.id;
-- select * from dates;
-- SELECT d1.record_date, d1.temprature 
-- FROM dates d1
-- JOIN dates d2 
-- 	ON (
-- 		extract(DAY FROM d1.record_date::TIMESTAMP) 
-- 		- 
-- 		extract(DAY FROM d2.record_date::TIMESTAMP)
-- 		= 1
-- 	);
select ('2022-06-22 14:00:00'::timestamp - '2022-06-20 14:00:00'::timestamp) as aa
select '2022-06-25 14:00:00'::date - '2022-06-20 14:00:00'::date;

select now(), now() - interval '22 days';
select '2022-06-22 14:00:00'::date - 22;
select '2022-06-22 14:00:00'::date - '10 days'::interval;
select '2022-06-22 14:00:00'::date - interval '10 d';
select ('2022-06-25 14:00:00' < '2022-06-23 14:00:00')::int;

select extract(month from record_date::timestamp) from dates;

select record_date - interval '1 day'  from dates;
select extract(day from record_date - interval '1 day')  from dates;

select
	now() - record_date as now,
	extract(day from now() - record_date) days,
	current_date - record_date as date
	from dates;