CREATE DATABASE NykaaDB;

USE NykaaDB;

Show databases;

CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
Gender VARCHAR(10),
City VARCHAR(30),
State VARCHAR(30),
JoinDate DATE
);

desc Customers;

INSERT INTO Customers VALUES
(101,'Aisha','Female','Mumbai','Maharashtra','2023-01-15'),
(102,'Priya','Female','Pune','Maharashtra','2023-03-18'),
(103,'Rahul','Male','Delhi','Delhi','2023-02-10'),
(104,'Sneha','Female','Bangalore','Karnataka','2024-01-05'),
(105,'Rohan','Male','Hyderabad','Telangana','2024-02-12'),
(106,'Pooja','Female','Nagpur','Maharashtra','2024-03-25'),
(107,'Karan','Male','Jaipur','Rajasthan','2024-04-15'),
(108,'Neha','Female','Surat','Gujarat','2024-05-01');

Select *from Customers;

CREATE TABLE Categories
(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(40)
);

desc Categories;

INSERT INTO Categories VALUES
(1,'Skin Care'),
(2,'Hair Care'),
(3,'Makeup'),
(4,'Perfume');

Select *from Categories;

CREATE TABLE Products
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
CategoryID INT,
Brand VARCHAR(50),
Price DECIMAL(10,2),
Stock INT,
FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);

desc Products;

INSERT INTO Products VALUES
(201,'Lakme Foundation',3,'Lakme',650,100),
(202,'Maybelline Lipstick',3,'Maybelline',550,150),
(203,'Mamaearth Face Wash',1,'Mamaearth',299,200),
(204,'Minimalist Serum',1,'Minimalist',699,80),
(205,'LOreal Shampoo',2,'LOreal',450,120),
(206,'Dove Conditioner',2,'Dove',350,110),
(207,'Bella Vita Perfume',4,'Bella Vita',799,60),
(208,'Nykaa Kajal',3,'Nykaa',299,180);

Select *from Products;

CREATE TABLE Orders
(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10,2),
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

desc Orders;

INSERT INTO Orders VALUES
(301,101,'2024-06-01',1200),
(302,102,'2024-06-02',850),
(303,103,'2024-06-05',999),
(304,104,'2024-06-08',1500),
(305,105,'2024-06-10',699),
(306,106,'2024-06-11',950),
(307,107,'2024-06-15',1800),
(308,108,'2024-06-20',799);

Select *from Orders;

CREATE TABLE OrderDetails
(
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
Discount DECIMAL(5,2),
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

desc OrderDetails;

INSERT INTO OrderDetails VALUES
(1,301,201,1,10),
(2,301,203,2,5),
(3,302,202,1,15),
(4,303,204,1,0),
(5,304,205,2,20),
(6,305,207,1,5),
(7,306,208,3,10),
(8,307,201,2,15),
(9,308,207,1,0);

Select *from OrderDetails;

CREATE TABLE Reviews
(
ReviewID INT PRIMARY KEY,
CustomerID INT,
ProductID INT,
Rating INT,
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

desc Reviews;

INSERT INTO Reviews VALUES
(1,101,201,5),
(2,102,202,4),
(3,103,204,5),
(4,104,205,3),
(5,105,207,4),
(6,106,208,5),
(7,107,201,4),
(8,108,207,5);

Select *from Reviews;

---QUESTION---

Display all details of the Customers table

SELECT *
FROM Products;

Display ProductName, Brand, Price from the Products table

SELECT ProductName, Brand, Price
FROM Products;

Display OrderID, CustomerID, OrderDate from the Orders table

SELECT OrderID, CustomerID, OrderDate
FROM Orders;

Show products costing more than ₹500

SELECT *
FROM Products
WHERE Price>500;

Show customers from Maharashtra

SELECT *
FROM Customers
WHERE State='Maharashtra';

Display all orders placed after 2024-06-05

SELECT *
FROM Orders
WHERE OrderDate > '2024-06-05';

Display all products in descending order of price

SELECT *
FROM Products
ORDER BY Price DESC;

Display customers according to their Join Date (latest first)

SELECT *
FROM Customers
ORDER BY JoinDate DESC;

Display orders from highest Total Amount

SELECT *
FROM Orders
ORDER BY TotalAmount DESC;

Find total products in each category

SELECT
    CategoryID,
    COUNT(ProductID) AS TotalProducts
FROM Products
GROUP BY CategoryID;

Find average product price by brand

SELECT
    Brand,
    AVG(Price) AS AvgPrice
FROM Products
GROUP BY Brand;

Find total quantity sold for each product

SELECT
    ProductID,
    SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID;

Display brands whose average product price is greater than ₹500

SELECT
Brand,
AVG(Price) AS AvgPrice
FROM Products
GROUP BY Brand
HAVING AVG(Price) > 500;

Display customers whose total spending is greater than ₹1000

SELECT
CustomerID,
SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 1000;

Display products whose total quantity sold is greater than 2

SELECT
ProductID,
SUM(Quantity) AS TotalQty
FROM OrderDetails
GROUP BY ProductID
HAVING SUM(Quantity) > 2;

Find total revenue

SELECT
    SUM(TotalAmount) AS TotalRevenue
FROM Orders;

Find average product price

SELECT
    AVG(Price) AS AvgPrice
FROM Products;

Display the top 5 most expensive products

SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 5;

Display the first 3 customers

SELECT *
FROM Customers
LIMIT 3;

Display the top 2 highest spending orders

SELECT *
FROM Orders
ORDER BY TotalAmount DESC
LIMIT 2;

Display Product Name and Category Name

SELECT
C.CustomerName,
O.OrderDate
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID;

Display the Customer Name, Order ID, Order Date, and Total Amount of customers who have placed orders

SELECT
    C.CustomerName, O.OrderID,O.OrderDate,O.TotalAmount
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID;

Display all customers along with their Order ID and Order Date. Also include customers who have not placed any order

SELECT
    C.CustomerName,
    O.OrderID,
    O.OrderDate
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID;

Find products priced above the average price

SELECT ProductName,Price
FROM Products
WHERE Price>
(
SELECT AVG(Price)
FROM Products
);

Find the most expensive product

SELECT ProductName,Price FROM Products
WHERE Price=(SELECT MAX(Price)
FROM Products
);

Find orders whose amount is greater than the average order amount

SELECT * FROM Orders
WHERE TotalAmount>
(SELECT AVG(TotalAmount)
FROM Orders);

Rank products by price
SELECT
ProductName,
Price,
RANK() OVER(ORDER BY Price DESC) AS ProductRank
FROM Products;

Rank customers by total spending

SELECT
CustomerID,
SUM(TotalAmount) AS TotalSpent,
RANK() OVER(ORDER BY SUM(TotalAmount) DESC) AS CustomerRank
FROM Orders
GROUP BY CustomerID;