CREATE DATABASE ECommerce_Analytics;
GO

USE ECommerce_Analytics;
GO
USE ECommerce_Analytics;
GO

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    sales_channel VARCHAR(50),
    payment_method VARCHAR(50),
    order_status VARCHAR(50)
);
GO
BULK INSERT Orders
FROM 'C:\Orders.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
SELECT TOP 10 *
FROM Orders;
SELECT 'Customers' AS TableName, COUNT(*) AS RowsCount
FROM Customers

UNION ALL

SELECT 'Orders', COUNT(*)
FROM Orders

UNION ALL

SELECT 'Order Detail', COUNT(*)
FROM [Order Detail]

UNION ALL

SELECT 'Products', COUNT(*)
FROM Products

UNION ALL

SELECT 'Returns', COUNT(*)
FROM Returns;
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
SELECT TOP 10 *
FROM Orders;
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Orders';
SELECT 
    sales_channel,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY sales_channel
ORDER BY Total_Orders DESC;
SELECT 
    YEAR(order_date) AS Order_Year,
    MONTH(order_date) AS Order_Month,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY 
    YEAR(order_date),
    MONTH(order_date)
ORDER BY 
    Order_Year,
    Order_Month;
    SELECT 
    YEAR(order_date) AS Order_Year,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY YEAR(order_date)
ORDER BY Order_Year;
SELECT TOP 10
    o.order_id,
    o.customer_id,
    o.order_date,
    od.product_id,
    od.quantity
FROM Orders o
INNER JOIN [Order Detail] od
    ON o.order_id = od.order_id;
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
SELECT TOP 10
    customer_id,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY customer_id
ORDER BY Total_Orders DESC;
SELECT
    DATENAME(WEEKDAY, order_date) AS Day_Name,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY DATENAME(WEEKDAY, order_date)
ORDER BY Total_Orders DESC;
SELECT
    CAST(order_date AS DATE) AS Order_Date,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY CAST(order_date AS DATE)
ORDER BY Order_Date;
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
SELECT
    COUNT(*) AS Total_Orders,
    COUNT(DISTINCT customer_id) AS Total_Customers
FROM Orders;
SELECT
    customer_id,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY Total_Orders DESC;
SELECT
    MIN(order_date) AS First_Order_Date,
    MAX(order_date) AS Last_Order_Date
FROM Orders;
SELECT
    YEAR(order_date) AS Order_Year,
    sales_channel,
    payment_method,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY
    YEAR(order_date),
    sales_channel,
    payment_method
ORDER BY
    Order_Year,
    Total_Orders DESC;
    SELECT
    YEAR(order_date) AS Order_Year,
    MONTH(order_date) AS Order_Month,
    sales_channel,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    sales_channel
ORDER BY
    Order_Year,
    Order_Month,
    Total_Orders DESC;
    SELECT
    order_id,
    customer_id,
    order_date,
    sales_channel,
    payment_method,
    YEAR(order_date) AS Order_Year,
    MONTH(order_date) AS Order_Month
FROM Orders;
CREATE VIEW vw_Orders_Analysis AS
SELECT
    order_id,
    customer_id,
    order_date,
    sales_channel,
    payment_method,
    YEAR(order_date) AS Order_Year,
    MONTH(order_date) AS Order_Month
FROM Orders;
GO
SELECT TOP 10 *
FROM vw_Orders_Analysis;