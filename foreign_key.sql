CREATE TABLE Branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(20)
     );

ALTER TABLE employee ADD branch_id INT;
ALTER TABLE employee ADD FOREIGN KEY (branch_id) REFERENCES Branch(branch_id);
