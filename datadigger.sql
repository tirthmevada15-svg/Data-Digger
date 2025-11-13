DROP DATABASE IF EXISTS DataDigger;
CREATE DATABASE DataDigger;
USE DataDigger;

-- 1️⃣ Create Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- 2️⃣ Insert at least 5 sample customers
INSERT INTO Customers (Name, Email, Address)
VALUES
('Alice', 'alice@example.com', '123 Apple St'),
('Bob', 'bob@example.com', '456 Banana Rd'),
('Charlie', 'charlie@example.com', '789 Cherry Ln'),
('Diana', 'diana@example.com', '321 Date Ave'),
('Eve', 'eve@example.com', '654 Elderberry Blvd');

-- 3️⃣ Retrieve all customer details
SELECT * FROM Customers;

-- 4️⃣ Update a customer’s address
UPDATE Customers
SET Address = '999 Updated St'
WHERE CustomerID = 2;

-- 5️⃣ Delete a customer using their CustomerID
DELETE FROM Customers
WHERE CustomerID = 4;

-- 6️⃣ Display all customers whose name is 'Alice'
SELECT * FROM Customers
WHERE Name = 'Alice';

-- 2️⃣ Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert at least 5 sample orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2025-10-10', 250.75),
(2, '2025-10-15', 120.50),
(1, '2025-11-01', 500.00),
(3, '2025-11-05', 300.25),
(5, '2025-11-10', 750.00);

-- Retrieve all orders made by a specific customer (example: CustomerID = 1)
SELECT * FROM Orders
WHERE CustomerID = 1;

-- Update an order’s total amount
UPDATE Orders
SET TotalAmount = 600.00
WHERE OrderID = 3;

-- Delete an order using its OrderID
DELETE FROM Orders
WHERE OrderID = 4;

-- Retrieve orders placed in the last 30 days
SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

-- Retrieve the highest, lowest, and average order amount
SELECT 
    MAX(TotalAmount) AS HighestOrder,
    MIN(TotalAmount) AS LowestOrder,
    AVG(TotalAmount) AS AverageOrder
FROM Orders;

-- 3️⃣ Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

-- Insert at least 5 sample products
INSERT INTO Products (ProductName, Price, Stock)
VALUES
('Laptop', 55000.00, 10),
('Headphones', 1500.00, 25),
('Smartphone', 18000.00, 15),
('Mouse', 600.00, 0),
('Keyboard', 1200.00, 20);

-- Retrieve all products sorted by price in descending order
SELECT * FROM Products
ORDER BY Price DESC;

-- Update the price of a specific product (example: ProductID = 2)
UPDATE Products
SET Price = 1600.00
WHERE ProductID = 2;

-- Delete a product if it’s out of stock
DELETE FROM Products
WHERE Stock = 0;

-- Retrieve products whose price is between ₹500 and ₹2000
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;

-- Retrieve the most expensive and cheapest product using MAX() and MIN()
SELECT 
    MAX(Price) AS MostExpensive,
    MIN(Price) AS Cheapest
FROM Products;

-- 4️⃣ OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert at least 5 sample records into the OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal)
VALUES
(1, 1, 1, 55000.00),
(2, 2, 2, 3000.00),
(3, 3, 1, 18000.00),
(3, 4, 3, 1800.00),
(5, 5, 2, 2400.00);

-- Retrieve all order details for a specific order (example: OrderID = 3)
SELECT * FROM OrderDetails
WHERE OrderID = 3;

-- Calculate the total revenue generated from all orders using SUM()
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;

-- Retrieve the top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;

-- Count how many times a specific product has been sold (example: ProductID = 2)
SELECT COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 2;
