DROP TABLE IF EXISTS emails;


CREATE TABLE emails (id serial PRIMARY KEY,
email varchar(100));


INSERT INTO emails (email)
VALUES ('user1@email.com'),
       ('user2@email.com'),
       ('user3@email.com'),
       ('user1@email.com'),
       ('user2@email.com'),
       ('user3@email.com'),
       ('user4@email.com'),
       ('user4@email.com'),
       ('user4@email.com');


DELETE
FROM emails
WHERE id not in
        (SELECT min(id) id
         FROM emails
         GROUP BY email);


SELECT *
FROM emails;