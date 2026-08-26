-- 1 Create Database
CREATE DATABASE DataDigger;
    --  Query OK, 1 row affected (0.183 sec)
USE DataDigger;
    -- Database changed




--  2: Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(255)
);
    -- Query OK, 0 rows affected (0.416 sec)





-- 3: Insert 5 Indian Customers
INSERT INTO Customers (CustomerID, Name, Email, Address)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 'Ahmedabad'),
(2, 'Priya Patel', 'priya@gmail.com', 'Surat'),
(3, 'Amit Shah', 'amit@gmail.com', 'Vadodara'),
(4, 'Neha Desai', 'neha@gmail.com', 'Mumbai'),
(5, 'Rohan Mehta', 'rohan@gmail.com', 'Rajkot');
-- o/p:
-- ok,5 rows affected (0.186 sec)
-- Records: 5  Duplicates: 0  Warnings: 0




-- 4: Display All Customers
SELECT * FROM Customers;
+------------+--------------+-----------------+-----------+
| CustomerID | Name         | Email           | Address   |
+------------+--------------+-----------------+-----------+
|          1 | Rahul Sharma | rahul@gmail.com | Ahmedabad |
|          2 | Priya Patel  | priya@gmail.com | Surat     |
|          3 | Amit Shah    | amit@gmail.com  | Vadodara  |
|          4 | Neha Desai   | neha@gmail.com  | Mumbai    |
|          5 | Rohan Mehta  | rohan@gmail.com | Rajkot    |
+------------+--------------+-----------------+-----------+
5 rows in set (0.018 sec)






-- 5: Update Customer Address
UPDATE Customers
    -> SET Address = 'Bharuch'
    -> WHERE CustomerID = 2;
--     o/p:
-- Query OK, 1 row affected (0.053 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0




-- 6 Delete a Customer
 DELETE FROM Customers
    -> WHERE CustomerID = 5;
-- o/p:
-- Query OK, 1 row affected (0.173 sec)





--   7 Display customers whose name is Rahul Patel:
 SELECT *
    -> FROM Customers
    -> WHERE Name = 'Rahul Patel';
-- o/p:
-- Empty set (0.014 sec)






-- 8 Create Orders Table
CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT NOT NULL,
    ->     OrderDate DATE NOT NULL,
    ->     TotalAmount DECIMAL(10,2) NOT NULL,
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
    -- o\p:
-- Query OK, 0 rows affected (0.466 sec)






-- 9 Insert 5 Orders in order table
 INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
    -> VALUES
    -> (101, 1, '2026-08-01', 2500.00),
    -> (102, 2, '2026-08-05', 1200.00),
    -> (103, 3, '2026-08-10', 3500.00),
    -> (104, 1, '2026-08-15', 1800.00),
    -> (105, 4, '2026-08-20', 4200.00);
    -- o/p:
-- Query OK, 5 rows affected (0.171 sec)
-- Records: 5  Duplicates: 0  Warnings: 0






-- 10 Display Orders of a Customer(rahul)
SELECT *
    -> FROM Orders
    -> WHERE CustomerID = 1;
--     o/p:
-- +---------+------------+------------+-------------+
-- | OrderID | CustomerID | OrderDate  | TotalAmount |
-- +---------+------------+------------+-------------+
-- |     101 |          1 | 2026-08-01 |     2500.00 |
-- |     104 |          1 | 2026-08-15 |     1800.00 |
-- +---------+------------+------------+-------------+
-- 2 rows in set (0.019 sec)







-- 11 : Update Order Amount
UPDATE Orders
    -> SET TotalAmount = 3000.00
    -> WHERE OrderID = 101;
    -- o/p:
-- Query OK, 1 row affected (0.142 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0






-- 12 : Delete an Order
DELETE FROM Orders
    -> WHERE OrderID = 105;
    -- o/p:
-- Query OK, 1 row affected (0.153 sec)






-- 13: Orders from Last 30 Days
 SELECT *
    -> FROM Orders
    -> WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
    -- o/p:
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|     101 |          1 | 2026-08-01 |     3000.00 |
|     102 |          2 | 2026-08-05 |     1200.00 |
|     103 |          3 | 2026-08-10 |     3500.00 |
|     104 |          1 | 2026-08-15 |     1800.00 |
+---------+------------+------------+-------------+
4 rows in set (0.020 sec)






-- 14: Highest, Lowest and Average Order Amount
SELECT
    ->     MAX(TotalAmount) AS Highest_Order,
    ->     MIN(TotalAmount) AS Lowest_Order,
    ->     AVG(TotalAmount) AS Average_Order
    -> FROM Orders;
    -- o/p:
+---------------+--------------+---------------+
| Highest_Order | Lowest_Order | Average_Order |
+---------------+--------------+---------------+
|       3500.00 |      1200.00 |   2375.000000 |
+---------------+--------------+---------------+
1 row in set (0.114 sec)





-- 15: Create Products Table
 CREATE TABLE Products (
    ->     ProductID INT PRIMARY KEY,
    ->     ProductName VARCHAR(100) NOT NULL,
    ->     Price DECIMAL(10,2) NOT NULL,
    ->     Stock INT NOT NULL
    -> );
    -- o/p:
-- Query OK, 0 rows affected (0.409 sec)






-- 16: Insert Products
INSERT INTO Products (ProductID, ProductName, Price, Stock)
    -> VALUES
    -> (201, 'Laptop', 55000.00, 10),
    -> (202, 'Samsung Mobile', 18000.00, 25),
    -> (203, 'Boat Headphones', 1500.00, 50),
    -> (204, 'HP Keyboard', 800.00, 30),
    -> (205, 'Wireless Mouse', 500.00, 0);
    -- o/p:
Query OK, 5 rows affected (0.174 sec)
Records: 5  Duplicates: 0  Warnings: 0








-- 17: Display Products by Price in descending order
SELECT *
    -> FROM Products
    -> ORDER BY Price DESC;
    -- o/p:
+-----------+-----------------+----------+-------+
| ProductID | ProductName     | Price    | Stock |
+-----------+-----------------+----------+-------+
|       201 | Laptop          | 55000.00 |    10 |
|       202 | Samsung Mobile  | 18000.00 |    25 |
|       203 | Boat Headphones |  1500.00 |    50 |
|       204 | HP Keyboard     |   800.00 |    30 |
|       205 | Wireless Mouse  |   500.00 |     0 |
+-----------+-----------------+----------+-------+
5 rows in set (0.014 sec)






-- 18: Update Product Price
PDATE Products
    -> SET Price = 20000.00
    -> WHERE ProductID = 202;
    -- o/p:
-- Query OK, 1 row affected (0.151 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0





-- 19 Delete Out-of-Stock Product
DELETE FROM Products
WHERE Stock = 0;
-- o/p: Query OK, 1 row affected (0.139 sec)






-- 20: Products Between 500 and 2000
 SELECT *
    -> FROM Products
    -> WHERE Price BETWEEN 500 AND 2000;
    -- o/p:
+-----------+-----------------+---------+-------+
| ProductID | ProductName     | Price   | Stock |
+-----------+-----------------+---------+-------+
|       203 | Boat Headphones | 1500.00 |    50 |
|       204 | HP Keyboard     |  800.00 |    30 |
+-----------+-----------------+---------+-------+
2 rows in set (0.014 sec)






-- 21: Find Most Expensive and Cheapest Price
SELECT
    ->     MAX(Price) AS Most_Expensive,
    ->     MIN(Price) AS Cheapest
    -> FROM Products;
    -- o/p:
+----------------+----------+
| Most_Expensive | Cheapest |
+----------------+----------+
|       55000.00 |   800.00 |
+----------------+----------+
1 row in set (0.012 sec)






-- 22: Create OrderDetails Table
CREATE TABLE OrderDetails (
    ->     OrderDetailID INT PRIMARY KEY,
    ->     OrderID INT NOT NULL,
    ->     ProductID INT NOT NULL,
    ->     Quantity INT NOT NULL,
    ->     SubTotal DECIMAL(10,2) NOT NULL,
    ->     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ->     FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    -> );
    -- o/p:
Query OK, 0 rows affected (0.530 sec)










-- 23: Insert Order Details
INSERT INTO OrderDetails
    -> (OrderDetailID, OrderID, ProductID, Quantity, SubTotal)
    -> VALUES
    -> (301, 101, 201, 1, 55000.00),
    -> (302, 102, 202, 2, 40000.00),
    -> (303, 103, 203, 3, 4500.00),
    -> (304, 104, 204, 2, 1600.00),
    -> (305, 101, 202, 1, 20000.00);
    -- o/p:
Query OK, 5 rows affected (0.167 sec)
Records: 5  Duplicates: 0  Warnings: 0







-- 24: Display Details of a Specific Order
SELECT *
    -> FROM OrderDetails
    -> WHERE OrderID = 101;
    -- o/p:
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|           301 |     101 |       201 |        1 | 55000.00 |
|           305 |     101 |       202 |        1 | 20000.00 |
+---------------+---------+-----------+----------+----------+
2 rows in set (0.011 sec)






-- 25: Calculate Total Revenue
SELECT SUM(SubTotal) AS Total_Revenue
    -> FROM OrderDetails;
    -- o/p:
+---------------+
| Total_Revenue |
+---------------+
|     121100.00 |
+---------------+
1 row in set (0.010 sec)





-- 26: Find Top 3 Most Ordered Products
 SELECT
    ->     ProductID,
    ->     SUM(Quantity) AS Total_Quantity
    -> FROM OrderDetails
    -> GROUP BY ProductID
    -> ORDER BY Total_Quantity DESC
    -> LIMIT 3;
    -- o/p:
+-----------+----------------+
| ProductID | Total_Quantity |
+-----------+----------------+
|       202 |              3 |
|       203 |              3 |
|       204 |              2 |
+-----------+----------------+
3 rows in set (0.015 sec)






-- 27: Count How Many Times a Product Was Sold
-- For Samsung Mobile (ProductID 202):

 SELECT COUNT(*) AS Times_Sold
    -> FROM OrderDetails
    -> WHERE ProductID = 202;
    -- o/p:
+------------+
| Times_Sold |
+------------+
|          2 |
+------------+
1 row in set (0.018 sec)