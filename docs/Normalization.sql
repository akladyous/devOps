Normalization
Normalization is the process of efficiently organising data in a database. The two main objectives of normalization are,eliminate redundant data ie to make sure that the same data is not stored twice and to ensure data dependencies make sense, ie to store only relational data in the table. Both of these are important because they reduce the amount of space of a database and ensure that data is logically stored.

Normal Forms
First, second, and third normal forms are stepping stones to the Boyce-Codd normal form and, when appropriate, the higher normal forms.

First Normal Form: The first normal form (1NF) is conclusive of a relational database. If we are to consider a database relational, then all relations in the database are in 1NF.

A database is considered relational if it satisfies 1NF and if a database satisfies 1NF, all the fields in the tables are atomic. it can also be described as the elimination of recurring groups of relations.1NF doesn't allow hierarchies of data values.

Second Normal Form: Second normal form (2NF) deals with the elimination of circular dependencies from a relation. We say a relation is in 2NF if it is in 1NF and if every non-key attribute is completely dependent only on the Primary Key.

A non-key attribute is any column that can not be used to uniquely identify the table.

Third Normal Form: Third normal form (3NF) deals with the elimination of non-key attributes that do not describe the Primary Key.For a relation to be in 3NF, the relationship between any two non key attributes, or groups of non-key attributes, must not be in a one to one relation.

The attributes should be mutually independent which means, none of the attributes should be functionally dependent on any combination of attributes. This mutual independence makes sure that any update on the individual attribute will not affect other attributes in a row.

Boyce-Codd Normal Form: Boyce-Codd Normal Form or BCNF is an extension to the third normal form, and is also known as 3.5 Normal Form.

A table should follow these two condistions to satisfy BCNF:

It should be in the Third Normal Form.
And, for any dependency A → B, A should be a super key. which means that A should be a non-key attribute if B is a key attribute.


Real World Applications of Normalization
Consider Order and customer, Instead of repeating customer name, address, phone no etc. in every order, you could save customer data to a customer table and have a foreign key field in the order that contains the primary key of the customer. For products and articles, Prices could change or items could run out of stock while the order is being edited.That way, the base data can change and will be up to date in all orders and new orders can quickly be connected to customer data if the customer orders again. And you can find all orders from that customer, even if the name is changed or ambiguous.

