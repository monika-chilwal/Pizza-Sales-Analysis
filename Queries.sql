-- 1. Calculate the total revenue generated from all pizza sales
SELECT SUM(total_price) AS Total_Revenue FROM pizza;

-- 2. Calculate the average value of each order
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value
FROM pizza;

-- 3. Calculate the total number of pizzas sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza;

-- 4. Count the total number of distinct orders placed
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;

-- 5. Calculate the average number of pizzas sold per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza;

-- Show the number of orders placed on each day of the week
SELECT 
    DAYNAME(order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza
GROUP BY DAYNAME(order_date)
LIMIT 0, 1000;

-- Analyze order frequency by hour of the day to identify peak business hours
SELECT 
    HOUR(order_time) AS order_hours, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time)
LIMIT 0, 1000;