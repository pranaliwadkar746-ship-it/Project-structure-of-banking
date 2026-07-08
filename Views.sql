-- create swiggy db
create database swiggy_db;

-- create table Swiggy_Orders
CREATE TABLE Swiggy_Orders (
    order_id      INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city          VARCHAR(30),
    restaurant    VARCHAR(50),
    item_ordered  VARCHAR(50),
    price         DECIMAL(8,2),
    delivery_status VARCHAR(20)
);

INSERT INTO Swiggy_Orders VALUES
(1, 'Rohan Mehta',  'Mumbai',    'Bikanervala',     'Chole Bhature',  180.00, 'Delivered'),
(2, 'Priya Nair',   'Bangalore', 'Truffles',        'Cheese Burger',  220.00, 'Delivered'),
(3, 'Aman Gupta',   'Delhi',     'Haldiram',        'Raj Kachori',    150.00, 'Cancelled'),
(4, 'Sneha Reddy',  'Hyderabad', 'Paradise Biryani', 'Chicken Biryani', 320.00, 'Delivered'),
(5, 'Karan Malhotra','Mumbai',   'Domino''s',       'Farmhouse Pizza', 399.00, 'Pending');

select *from swiggy_orders;

-- creat view
CREATE VIEW Delivered_Orders AS
select order_id, customer_name, city, restaurant, item_ordered, price
from Swiggy_Orders
where delivery_Status = 'Delivered';

-- Ab isko normal table jaise query karo:
select *from Delivered_orders;

CREATE OR replace View Delivered_Orders AS
select order_id, customer_name, city, restaurant, item_ordered, price, delivery_status
from Swiggy_Orders
where delivery_Status IN ('Delivered', 'Pending');

select *from Delivered_orders;

update Delivered_Orders
SET Price = 200.00
Where order_id = 1;

-- Ab check karo view mein:
Select *from Delivered_orders where order_ID = 2;
select *from swiggy_orders where order_id = 1;

update swiggy_orders set price = 250 where order_id = 2;
