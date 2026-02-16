create database ecommerce_analytics;
use ecommerce_analytics;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    city VARCHAR(100),
    registration_date DATE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    customer_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Products (product_name, category, price, stock) VALUES
('Laptop', 'Electronics', 60000, 50),
('Smartphone', 'Electronics', 30000, 100),
('Shoes', 'Fashion', 3000, 200),
('Watch', 'Accessories', 5000, 150);

INSERT INTO Customers (customer_name, email, city, registration_date) VALUES
('Amit', 'amit@gmail.com', 'Mumbai', '2024-01-10'),
('Riya', 'riya@gmail.com', 'Delhi', '2024-02-15'),
('Karan', 'karan@gmail.com', 'Pune', '2024-03-20');

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-05-01', 90000),
(2, '2024-05-15', 30000),
(1, '2024-06-10', 3000),
(3, '2024-06-20', 60000);

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1,1,1,60000),
(1,2,1,30000),
(2,2,1,30000),
(3,3,1,3000),
(4,1,1,60000);

INSERT INTO Reviews (product_id, customer_id, rating, review_date) VALUES
(1,1,5,'2024-05-05'),
(1,3,4,'2024-06-22'),
(2,2,3,'2024-05-18'),
(3,1,4,'2024-06-15');

SELECT p.product_name,
       SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_sales
FROM Orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT c.customer_name,
       COUNT(o.order_id) AS total_orders,
       SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

SELECT p.product_name,
       ROUND(AVG(r.rating),2) AS avg_rating,
       COUNT(r.review_id) AS total_reviews
FROM Products p
LEFT JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id
ORDER BY avg_rating DESC;

SELECT p.product_name,
       SUM(oi.quantity * oi.price) AS revenue
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY revenue DESC
LIMIT 3;





