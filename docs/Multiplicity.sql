Description
Multiplicity can be clasified as four types:

one to one relationship
one to many relationship
many to one relationship
many to many relationship
Multiple instances of the same or multiple entities can be associated with one or many instances.

Real world applications
The Multiplicity is the constraint on the collection of the association objects whereas the Cardinality is the count of the objects that are in collection. It actually acts as a constraint on cardinality. A multiplicity is made up of a lower and an upper cardinality. It tells you the minimum and maximum allowed members of the set.

Implementation
When data modeling techniques talk about relationships, we use the term cardinality to show how many entities may be linked together. So we might have a relationship between order and customer and say that the cardinality of the relationship is one-to-many.

But, UML avoids the term cardinality preferring to use multiplicity. Often people iwth a data modeling background are surprised at this since cardinality has been so widely used in data modeling circles.

The reason for the change is that the disctionary definition of cardinality is 'the number of elements in a particular set or other grouping".

Example

| 0-1 ------------ 1-* |

Multiplicities:
First Multiplicity, for the left entity: 0-1 Second Multiplicity, for the right entity: 1-*
Cardinalities for the first multiplicity: Lower cardinality: 0 Upper cardinality: 1
Cardinalities for the second multiplicity: Lower cardinality: 1 Upper cardinality: *

Summary
The Multiplicity of a relationship specifies the cardinality or number of instances of an EntityType that can be associated with the instances of another EntityType.

The Multiplicity is a constraint on the cardinality, which shall:

not be less than the lower bound
and not greater than the upper bound specified
A Multiplicity that is not multivalues can represent at most a single value.

