DROP TABLE IF EXISTS users;
CREATE TABLE users (
    userID SERIAL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(64) NOT NULL CHECK (CHAR_LENGTH(password) BETWEEN 6 AND 32),
    status BOOLEAN,
    created_at TIMESTAMP DEFAULT current_timestamp,
    test smallint NOT NULL
);
ALTER TABLE users
	ADD COLUMN is_email_verified BOOLEAN DEFAULT false;
ALTER TABLE users
    RENAME COLUMN status TO is_active;
ALTER TABLE users
    ALTER COLUMN is_active SET DEFAULT true ; -- DROP DEFAULT / SET NOT NULL / DROP NOT NULL
ALTER TABLE users
    ALTER COLUMN test DROP NOT NULL;
ALTER TABLE users
    DROP COLUMN test;
-- --------------------------------------------------------------------------------
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    ID SERIAL PRIMARY KEY,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(64) NOT NULL CHECK (CHAR_LENGTH(password) BETWEEN 6 AND 32),
    is_active BOOLEAN DEFAULT true,
    is_email_verified BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT current_timestamp
);
INSERT INTO users
	(email, password)
	VALUES
	('user1@email.com', '000000'),
	('user2@email.com', '000000'),
	('user3@email.com', '000000'),
	('user4@email.com', '000000'),
	('user5@email.com', '000000');
SELECT * FROM users;

UPDATE users
    SET password = '123456'
    WHERE email = 'user1@email.com'
    RETURNING *;
UPDATE users
    SET email = 'user1@gmail.com', password = '654321', is_email_verified = true
    where email = 'user2@email.com' AND id = 2
    RETURNING *;

DROP TABLE IF EXISTS user_profile CASCADE;
CREATE TABLE user_profile (
    id SERIAL PRIMARY KEY,
    first_name  varchar(25) NOT NULL,
    last_name   varchar(25) NOT NULL,
    age smallint CHECK (age BETWEEN 18 AND 118),
	user_id integer	REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO 
	user_profile
	(first_name, last_name, age, user_id)
	VALUES
	('marc',   'smith', 30, 1),
	('alex',   'lopez', 36, 2),
	('marine', 'droff', 23, 3),
	('paul',   'marc',  19, 4),
	('sarah',  'franc', 19, 5);

DROP TABLE IF EXISTS images CASCADE;
CREATE TABLE images (
    id SERIAL PRIMARY KEY,
    url varchar(200),
    user_id integer REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE
);
DELETE FROM images;
INSERT INTO images
    (url, user_id)
    VALUES
    ('htt2://foto_1.png', 1),
    ('htt3://foto_1.png', 2),
    ('htt4://foto_1.png', 3),
    ('http://foto_1.png', 4),
    ('http://foto_1.png', 5),
    
    ('http://foto_2.png', 1),
    ('http://foto_3.png', 1),
    ('http://foto_4.png', 1),
    ('http://foto_5.png', 1),
    ('http://foto_6.png', 1),
    
    ('http://foto_2.png', 2),
    ('http://foto_3.png', 2),
    ('http://foto_4.png', 2),
    ('http://foto_5.png', 2),
    
    ('http://foto_2.png', 3),
    ('http://foto_3.png', 3),
    ('http://foto_4.png', 3),
    
    ('http://foto_2.png', 4),
    ('http://foto_3.png', 4),

    ('http://foto_2.png', 5),
    ('http://foto_0.png', null);


DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    comment text,
    user_id  integer REFERENCES  users(id) ON DELETE SET NULL ON UPDATE CASCADE,
    image_id integer REFERENCES images(id) ON DELETE SET NULL ON UPDATE CASCADE
);
DELETE FROM comments;
INSERT INTO comments
    (comment, user_id, image_id)
    VALUES
    ('comment 1', 1, 2),
    ('comment 2', 1, 2),
    ('comment 3', 1, 3),
    ('comment 4', 1, 3),
    ('comment 5', 1, 3),
    ('comment 5', 1, 4),
    ('comment 6', 1, 5),
    
    ('comment 1', 2, 1),
    ('comment 2', 2, 3),
    ('comment 3', 2, 4),
    ('comment 4', 2, 5),
    
    ('comment 1', 3, 1),
    ('comment 2', 3, 1),
    ('comment 3', 3, 2),
    ('comment 4', 3, 2),
    ('comment 5', 3, 4),
    ('comment 6', 3, 5),
    ('comment 7', 3, 5),
    
    ('comment 1',  4, 1),
    ('comment 2',  4, 1),
    ('comment 3',  4, 1),
    ('comment 4',  4, 1),
    ('comment 5',  4, 1),
    ('comment 6',  4, 1),
    ('comment 7',  4, 2),
    ('comment 8',  4, 2),
    ('comment 9',  4, 3),
    ('comment 10', 4, 5),

    ('comment 1', 5, 1),
    ('comment 2', 5, 2),
    ('comment 3', 5, 2),
    ('comment 4', 5, 3),
    ('comment 5', 5, 3),
    ('comment 6', 5, 3),
    ('comment 7', 5, 4);
