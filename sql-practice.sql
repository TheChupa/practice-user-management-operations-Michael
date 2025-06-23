-- insert the users into table

INSERT INTO users (username, firstName, lastName, age)
VALUES
 ('asmith', 'Alice', 'Smith', 20),
 ('bdoe', 'Bob', 'Doe', 33),
 ('cjohnson', 'Charlie', 'Johnson', 41),
 ('dlee', 'David', 'Lee', 19),
 ('ejones', 'Eve', 'Jones', 30),
 ('fkim', 'Frank', 'Kim', 15),
 ('gwhite', 'Grace', 'White', 22),
 ('hwang', 'Henry', 'Wang', 19),
 ('ijones', 'Ivy', 'Jones', 50),
 ('jdoe', 'John', 'Doe', 65),
 ('klee', 'Kevin', 'Lee', 62),
 ('lchen', 'Linda', 'Chen', 24),
 ('mlee', 'Michael', 'Lee', 29),
 ('nkim', 'Nancy', 'Kim', 18),
 ('ojohnson', 'Oscar', 'Johnson', 40),
 ('pchen', 'Peter', 'Chen', 55),
 ('qwang', 'Quincy', 'Wang', 28),
 ('rjones', 'Rachel', 'Jones', 37),
 ('slee', 'Sam', 'Lee', 21),
 ('tkim', 'Tina', 'Kim', 26);
 
 -- displays all the columns from the table users 
 
 SELECT * FROM users;
 
 
 -- updates the user jdoe is, example contained username, I am going to change to ID 
 
 UPDATE users SET firstName = 'Jane', lastName = 'Doe' WHERE ID= '70';
-- updates the firstName of all entries containing 'doe'  

 UPDATE users SET firstName = 'Jane' WHERE lastName = 'Doe';
 
 -- deletes all entries in userName = 'jdoe;
 
 DELETE FROM users WHERE username = 'jdoe'AND age = 65;
 
 --  displays the entry is firstname, lastname from the table users where the lastname = something
 
SELECT firstName, lastName FROM users WHERE lastName = 'Doe';
 
 -- displays all in users 

SELECT * FROM users;
 
 -- COMPOUND CONDITIONS
 
 SELECT * FROM users WHERE lastName = 'Doe' AND firstName = 'John';
 SELECT * FROM users WHERE lastName = 'Doe' OR firstName = 'John';
 SELECT * FROM users WHERE lastName = 'Doe' AND NOT firstName = 'John';
 SELECT * FROM users WHERE lastName = 'Doe' AND (firstName = 'John' or firstName = 'Jane');
 
 -- Alias CHanges names of columns to be listed as "input"
 
 SELECT firstName AS First, lastName AS Last FROM users;
 
 -- Calculated Fields 
 
 -- adds 10 to the age field and displays it in the ageIn10Years which is being created.
 
 
 SELECT username, age + 10 AS ageIn10Years FROM users;
 
 -- creates a new concat out of the firstname and last name as a new column fullName
 
 SELECT concat(firstName,' ',lastName) AS fullName FROM users;
 
 -- ORDER BY and LIMIT
 
 -- displays all users in order by descending age
 
 SELECT * FROM users ORDER BY age DESC;
 
  -- displays the users by lastname and firstname ascending 
 SELECT * FROM users ORDER BY lastName ASC, firstName ASC;
 
 
--  limit and offset


 -- Selects the first 5 from the table
 
 SELECT * FROM users LIMIT 5;
 -- Lists the 5 after going 5 down the list. 
 SELECT * FROM users LIMIT 5 OFFSET 5;
 
 
 -- Can combine the multiple tools
 
 -- selec all from the user table orders by lastName A-Z and shows 10 entries after skipping the first 10 entries. 
 SELECT * FROM users ORDER BY lastName ASC LIMIT 10 OFFSET 10;
 
