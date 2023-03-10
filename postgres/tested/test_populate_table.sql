DROP TABLE IF EXISTS users CASCADE ;
CREATE TABLE users (
    ID SERIAL PRIMARY KEY,
    first_name VARCHAR(50) UNIQUE NOT NULL,
	last_name VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(64) NOT NULL CHECK (CHAR_LENGTH(password) BETWEEN 6 AND 64),
    created_at TIMESTAMP DEFAULT current_timestamp
);

INSERT INTO users (id, first_name, last_name, email, password, created_at)
SELECT 
  faker.id,
  faker.first_name, 
  faker.last_name, 
  faker.email, 
  faker.password, 
  NOW()
FROM 
  (
    SELECT 
      generate_series(1, 10) AS id,
      ( SELECT  CONCAT( LEFT(MD5(RANDOM()::text), 10),  '@', LEFT(MD5(RANDOM()::text), 5), '.com' ) AS email) AS email,
      ( SELECT LEFT(MD5(RANDOM()::text), 20) AS password ) AS password,
      ( SELECT LEFT(MD5(RANDOM()::text), 20) AS first_name ) AS first_name,
      ( SELECT LEFT(MD5(RANDOM()::text), 20) AS last_name ) AS last_name
    FROM 
      generate_series(1, 10)
  ) faker;
