Referential Integrity
Referential integrity is the relationship between tables. Each table in a database has a primary key, this primary key can appear in other tables because of its relationship to data within other tables.
When a primary key from one table appears in another table, it is called a foreign key.
Referential integrity does not allow the addition of any record in a table that contains the foreign key unless the reference table contains a corresponding primary key.
Referential integrity does not allow to deletion of a record in a table that contains the foreign key, to delete the record in the parent table, the corresponding record in the child table should be deleted first. to solve this issue ON DELETE CASCADE is used.
Other options are to set the foreign key to null or to its default value (only if the default value references an existing value in the primary-key table).

 CREATE TABLE Student(
    student_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    Major VARCHAR(20)
    );


CREATE TABLE InternationalStudent(
    country_id INT PRIMARY KEY,
    name VARCHAR(20),
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES Student(student_id)
    ON DELETE CASCADE
);


INSERT INTO Student VALUES(1,"Taylor", "Swift","English Literature");
INSERT INTO Student VALUES(2,"Stephen", "Hawking","Physics");
INSERT INTO InternationalStudent VALUES(1,"USA",2);
INSERT INTO InternationalStudent VALUES(2,"USA",2);

DELETE FROM Student WHERE Major="English Literature";

SELECT * FROM InternationalStudent;
