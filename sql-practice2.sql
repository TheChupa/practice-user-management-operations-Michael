-- Group by 

-- selects from customer_id colum, grabs the total_amount from  each colums and if they have the same customer ID adds them together and returns the customerID and the Total_spent to indicate that a column has changed

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;
-- selects from customer ID and orderdate in Orders adds them togetther if they would of shared both the ID and the orderDate

SELECT customer_id, order_date, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id, order_date;

-- Having and Where clauses
-- in orders, uses customer_id to see if the total amount is over 200. This show customer 1 and customer 3 has spent over 200
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
WHERE total_amount >= 200
GROUP BY customer_id; 

-- in orders, by customer_id, add the total spent per entry if the total purchased was over 200, so customer 3 had an order for 250 and 300, customer 1 has an order of 100 and 150, but customer 2 had only 1 order of 200, so it's not displayed.  

SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 200;


-- Inner Joins

-- displays the orders.id, customer firstname, customer lastname, order date from oders and total_amount from orders 

-- the join happens on customers.id because the orders.customer id = customers.id so this is how we line up the orders to match the customers. Only returns data that has matching ids

SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;



-- Left Outer Join (Left Join)
--  Similiar to Inner Joins, but will display data that doesn't have a match. You can see that id 6 is returned, but no customer name yet because that customer doesn't exist in system

SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;

-- Right Outer Join (Right Join)
--

SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.id;


-- Full Join
--  use UNION to combine left and right joins
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id

UNION

SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.id;



-- SubQueries

-- Scalar Subqueries 

-- returns entries from orders where the total amount is >= average from orders 

SELECT id, order_date, total_amount
FROM orders
WHERE total_amount >= (SELECT AVG(total_amount) FROM orders); 

-- Column Subqueries

--   returns all id, order date and total amount.  customer_id comes from id in customers (not orders) because of the clause. since the id and customer_id now match up, they only display the data that matched.

SELECT id, order_date, total_amount, customer_id
FROM orders
WHERE customer_id IN (SELECT id FROM customers WHERE last_name = 'Smith');

-- Table Subqueries
-- Can insert these when referencing tables

SELECT id, order_date, total_amount
FROM (SELECT id, order_date, total_amount FROM orders) AS order_summary; 