USE ecommerce_db;

-- Query to select all users where the name is between 'A' and 'M'
SELECT *
FROM Users
WHERE name BETWEEN 'A' AND 'M';

-- Query to select all users where the name contains the letter 'e'
SELECT *
FROM Users
WHERE name LIKE '%e%';

-- Query to select all users where the name ends with the letter 'z'
SELECT *
FROM Users
WHERE name LIKE '%z';

-- Query to select all products where the name starts with the letter 'T'
SELECT *
FROM Products
WHERE name LIKE 'T%';

-- Query to select all suppliers where the name contains the letter 'o'
SELECT *
FROM Suppliers
WHERE name LIKE '%o%';

-- Query to select all users where the name is 'Carlos García'
SELECT *
FROM Users
WHERE name = 'Carlos García';

-- Query to select all products where the name is 'Television'
SELECT *
FROM Products
WHERE name = 'Television';

-- Query to select all users where the name is between 'A' and 'M'
SELECT *
FROM Users
WHERE name BETWEEN 'A' AND 'M';

-- Query to select all users where the name starts with 'J' and contains 'a'
SELECT *
FROM Users
WHERE name LIKE 'J%' AND name LIKE '%a%';

-- Query to view all pending orders to be shipped
SELECT Orders.id, Users.name, Orders.total, Shipments.shipping_status
FROM Orders
INNER JOIN Users ON Orders.user_id = Users.id
INNER JOIN Shipments ON Orders.id = Shipments.order_id
WHERE Shipments.shipping_status = 'Pending';

-- Query to get product and supplier details for a specific order
SELECT Orders.id, Products.name, Suppliers.name, Order_Details.quantity, Order_Details.unit_price
FROM Order_Details
INNER JOIN Orders ON Order_Details.order_id = Orders.id
INNER JOIN Products ON Order_Details.product_id = Products.id
INNER JOIN Suppliers ON Products.supplier_id = Suppliers.id
WHERE Orders.id = 1;

-- Query to list all payment methods used in orders
SELECT Orders.id, Payment_Methods.name, Payments.amount, Payments.payment_status
FROM Payments
INNER JOIN Orders ON Payments.order_id = Orders.id
INNER JOIN Payment_Methods ON Payments.payment_method_id = Payment_Methods.id;

-- Query to get the total number of products sold (quantity) by each category
SELECT Categories.name, SUM(Order_Details.quantity)
FROM Order_Details
INNER JOIN Products ON Order_Details.product_id = Products.id
INNER JOIN Categories ON Products.category_id = Categories.id
GROUP BY Categories.name;

-- Query to get information for all orders along with the name of the user who placed the order
SELECT Orders.id, Users.name, Orders.total, Orders.status
FROM Orders
INNER JOIN Users ON Orders.user_id = Users.id;
