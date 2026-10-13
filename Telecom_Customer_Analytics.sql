CREATE DATABASE Telecom_Customer_Analytics;
GO

USE Telecom_Customer_Analytics;
GO
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    Contract_Type VARCHAR(30),
    Monthly_Charges DECIMAL(10,2),
    Tenure_Months INT,
    Payment_Method VARCHAR(30),
    Churn VARCHAR(10)
);
GO
BULK INSERT Customers
FROM 'C:\Telecom_Customers.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO
BULK INSERT Customers
FROM 'C:\Customers.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

SELECT TOP 10 *
FROM Customers;
BULK INSERT Customers
FROM 'C:\Customers.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);
GO

SELECT TOP 10 *
FROM Customers;
DROP TABLE IF EXISTS Customers_Import;
GO
DROP TABLE IF EXISTS Customers_Import;
GO
DROP TABLE Customers;
GO

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    Customer_Type VARCHAR(30),
    Plan_Type VARCHAR(30),
    Tenure_Months INT
);
GO
SELECT COUNT(*) AS Total_Customers
FROM Customers;
CREATE VIEW VW_Customer_Analysis AS
SELECT
    Customer_ID,
    Gender,
    Age,
    City,
    Customer_Type,
    Plan_Type,
    Tenure_Months
FROM Customers;
GO
-- 1. Customers by Gender
SELECT
    Gender,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Gender;
GO

-- 2. Customers by City
SELECT
    City,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY City
ORDER BY Total_Customers DESC;
GO

-- 3. Customers by Customer Type
SELECT
    Customer_Type,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Customer_Type
ORDER BY Total_Customers DESC;
GO

-- 4. Customers by Plan Type
SELECT
    Plan_Type,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Plan_Type
ORDER BY Total_Customers DESC;
GO

-- 5. Average Tenure
SELECT
    AVG(Tenure_Months) AS Average_Tenure_Months
FROM Customers;
GO