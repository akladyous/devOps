CREATE TABLE department (
	dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
	dept_location VARCHAR(30) NOT NULL
)

CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary integer NOT NULL,
    dept_id integer NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES department (dept_id)
)

INSERT INTO
	department (dept_name, dept_location)
	VALUES
	('dep 1', 'loc 1'),
	('dep 2', 'loc 2'),
	('dep 3', 'loc 3'),
	('dep 4', 'loc 4'),
	('dep 5', 'loc 5'),
	('dep 6', 'loc 5') ;


select d.dept_id from department as d
INNER JOIN employee e
ON e.dept_id = d.dept_id
group by d.dept_id;



select d.dept_id, e.salary from department as d
INNER JOIN employee as e ON e.dept_id = d.dept_id
group by d.dept_id
order by d.dept_id asc;