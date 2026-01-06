##Create the following dummy tables in MYSQL Workbench using CREATE FUNCTION-
CREATE DATABASE sql_joins_db1;
USE sql_joins_db1;
##Table 1:Customers
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
City VARCHAR(50)
);
SELECT * FROM Customers;
INSERT INTO Customers (CustomerID,CustomerName,City)
VALUES
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');
SELECT * FROM Customers;
##TABLE 2: Orders
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Amount int
);
SELECT * FROM Orders;
INSERT INTO Orders (OrderID,CustomerID,OrderDate,Amount)
VALUES
(101, 1, '2024-10-01',250),
(102, 2, '2024-10-05',300),
(103, 1, '2024-10-07',150),
(104, 3, '2024-10-10',450),
(105, 6, '2024-10-12',400);
SELECT * FROM Orders;
##Table 3: Payments
CREATE TABLE Payments (
PaymentID VARCHAR(10) PRIMARY KEY,
CustomerID INT,
PaymentDate DATE,
Amount int);
SELECT * FROM Payments;
INSERT INTO Payments (PaymentID,CustomerID,PaymentDate,Amount)
VALUES
('P001',1, '2024-10-02' , 250),
('P002',2, '2024-10-06' , 300),
('P003',3, '2024-10-11' , 450),
('P004',4, '2024-10-15' ,200);
SELECT * FROM Payments;
##Table 4: Employees
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
ManagerID INT 
);
SELECT * FROM Employees;
INSERT INTO Employees (EmployeeID,EmployeeName,ManagerID)
VALUES
(1,'Alex Green', NULL),
(2,'Brian Lee',1),
(3,'Carol Ray',1),
(4,'David Kim',2),
(5,'Eva Smith',2);
SELECT * FROM Employees;
##QUESTION 1: Retrieve all customers who have placed at least one order.
SELECT DISTINCT c.CustomerID,c.CustomerName,c.City
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID =o. CustomerID;
##QUESTION 2: Retrieve all customers and their orders,including customers who have not placed any orders.
SELECT c.CustomerID, C.CustomerName, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c. CustomerID= o.CustomerID
WHERE o.OrderID IS NULL;
##QUESTION 3: Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
SELECT o.OrderID, o.OrderDate, o.Amount, c.CustomerName
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID =o. CustomerID;
##QUESTION 4: Display all customers and orders, whether matched or not.
SELECT c.CustomerID,c.CustomerName,c.City,o.OrderID,o.OrderDate,o.Amount
FROM Customers C 
LEFT JOIN Orders O 
ON c.CustomerID=o.CustomerID;
##QUESTION 5: Find customers who have not placed any orders. 
SELECT c.CustomerID,c. CustomerName
FROM Customers c 
LEFT JOIN Orders o 
ON c. CustomerID=o.CustomerID
WHERE o.OrderID IS NULL;
##QUESTION 6: Retrieve customers who made payments but did not placed any orders. 
SELECT DISTINCT c.CustomerID,c.CustomerName
FROM Customers c 
INNER JOIN Payments p 
ON c.CustomerID = p.CustomerID
WHERE o.OrderID IS NULL;
##QUESTION 7: Generate a list of all posssible combinations between Customers and Orders.
SELECT c.CustomerName, o.OrderID 
FROM Customers c  
CROSS JOIN Orders o;
##QUESTION 8: Show all customers along with order and payment amounts in one table. 
SELECT c.CustomerName,
o.OrderID,
o.Amount AS OrderAmount,
p.Amount AS PaymentAmount
FROM Customers c 
LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID 
LEFT JOIN Payments p 
ON c.CustomerID= p.CustomerID; 
##QUESTION 9: Retrieve all customers who have both placed orders and made payments. 
SELECT DISTINCT c.CustomerID, c.CustomerName 
FROM Customers c 
INNER JOIN Orders o 
ON c. CustomerID = o. CustomerID 
INNER JOIN Payments p 
ON c. CustomerID=p.CustomerID;



