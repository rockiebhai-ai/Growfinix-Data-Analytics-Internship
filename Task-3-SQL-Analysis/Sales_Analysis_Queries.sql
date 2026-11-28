CREATE DATABASE project_analysis;
USE project_analysis;

CREATE TABLE sales_data (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    category VARCHAR(30),
    sales INT,
    region VARCHAR(20)
);
INSERT INTO sales_data VALUES
(101, 'Arun', 'Electronics', 15000, 'South'),
(102, 'Priya', 'Clothing', 3000, 'North'),
(103, 'Karthik', 'Electronics', 25000, 'South'),
(104, 'Divya', 'Furniture', 12000, 'West'),
(105, 'Suresh', 'Clothing', 4500, 'East');
SELECT customer_name, category, sales 
FROM sales_data 
WHERE region = 'South' 
ORDER BY sales DESC;
SELECT category, 
       COUNT(*) AS total_orders, 
       SUM(sales) AS total_sales, 
       AVG(sales) AS avg_sales
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;
SELECT region, SUM(sales) AS region_sales
FROM sales_data
GROUP BY region
ORDER BY region_sales DESC;
CREATE TABLE customers (
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers (customer_name, city) VALUES 
('Karthik', 'Chennai'),
('Divya', 'Mumbai'),
('Suresh', 'Kolkata');
SELECT 
    s.customer_name, 
    c.city, 
    s.category, 
    s.sales, 
    s.region
FROM sales_data s
INNER JOIN customers c 
ON s.customer_name = c.customer_name;
SELECT 
    c.city, 
    SUM(s.sales) AS city_total_sales
FROM sales_data s
INNER JOIN customers c 
ON s.customer_name = c.customer_name
GROUP BY c.city
ORDER BY city_total_sales DESC;