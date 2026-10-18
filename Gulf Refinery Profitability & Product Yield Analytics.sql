CREATE DATABASE Gulf_Refinery_Analytics;
GO

USE Gulf_Refinery_Analytics;
GO
USE Gulf_Refinery_Analytics;
GO

CREATE TABLE Dim_Refinery (
    Refinery_ID INT PRIMARY KEY,
    Refinery_Name VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    Refinery_Type VARCHAR(50),
    Daily_Capacity_Barrels INT
);
GO
USE Gulf_Refinery_Analytics;
GO

INSERT INTO Dim_Refinery (
    Refinery_ID,
    Refinery_Name,
    Country,
    City,
    Refinery_Type,
    Daily_Capacity_Barrels
)
VALUES
(1, 'Ras Tanura Refinery', 'Saudi Arabia', 'Ras Tanura', 'Integrated', 550000),
(2, 'Jazan Refinery', 'Saudi Arabia', 'Jazan', 'Conversion', 400000),
(3, 'Ruwais Refinery', 'UAE', 'Abu Dhabi', 'Integrated', 922000),
(4, 'Jebel Ali Refinery', 'UAE', 'Dubai', 'Conversion', 120000),
(5, 'Mina Al Ahmadi Refinery', 'Kuwait', 'Ahmadi', 'Integrated', 346000),
(6, 'Al-Zour Refinery', 'Kuwait', 'Al-Zour', 'Conversion', 615000),
(7, 'Mesaieed Refinery', 'Qatar', 'Mesaieed', 'Hydroskimming', 137000),
(8, 'Sohar Refinery', 'Oman', 'Sohar', 'Conversion', 116000);
GO

SELECT * FROM Dim_Refinery;
GO
USE Gulf_Refinery_Analytics;
GO

CREATE TABLE Dim_Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Product_Category VARCHAR(50),
    Market_Type VARCHAR(50),
    Unit_Of_Measure VARCHAR(20)
);
GO
USE Gulf_Refinery_Analytics;
GO

INSERT INTO Dim_Product (
    Product_ID,
    Product_Name,
    Product_Category,
    Market_Type,
    Unit_Of_Measure
)
VALUES
(1, 'Gasoline', 'Light Products', 'Retail', 'Barrels'),
(2, 'Diesel', 'Middle Distillates', 'Commercial', 'Barrels'),
(3, 'Jet Fuel', 'Middle Distillates', 'Aviation', 'Barrels'),
(4, 'LPG', 'Light Products', 'Commercial', 'Tonnes'),
(5, 'Naphtha', 'Light Products', 'Industrial', 'Barrels'),
(6, 'Fuel Oil', 'Heavy Products', 'Industrial', 'Barrels'),
(7, 'Sulfur', 'By-products', 'Industrial', 'Tonnes'),
(8, 'Petroleum Coke', 'Heavy Products', 'Industrial', 'Tonnes');
GO

SELECT * FROM Dim_Product;
GO
USE Gulf_Refinery_Analytics;
GO

CREATE TABLE Fact_Refining (
    Refining_ID INT PRIMARY KEY,
    Refinery_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Refining_Date DATE NOT NULL,
    Crude_Input_Barrels DECIMAL(18,2),
    Product_Output_Barrels DECIMAL(18,2),
    Processing_Cost_USD DECIMAL(18,2),
    FOREIGN KEY (Refinery_ID)
        REFERENCES Dim_Refinery(Refinery_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Dim_Product(Product_ID)
);
GO
USE Gulf_Refinery_Analytics;
GO

INSERT INTO Fact_Refining (
    Refining_ID,
    Refinery_ID,
    Product_ID,
    Refining_Date,
    Crude_Input_Barrels,
    Product_Output_Barrels,
    Processing_Cost_USD
)
VALUES
(1, 1, 1, '2025-01-01', 100000, 22000, 180000),
(2, 1, 2, '2025-01-01', 100000, 35000, 210000),
(3, 1, 3, '2025-01-01', 100000, 12000, 95000),
(4, 1, 5, '2025-01-01', 100000, 10000, 70000),
(5, 1, 6, '2025-01-01', 100000, 8000, 60000),
(6, 1, 1, '2025-02-01', 105000, 23500, 190000),
(7, 1, 2, '2025-02-01', 105000, 36000, 215000),
(8, 1, 3, '2025-02-01', 105000, 13000, 98000),
(9, 2, 1, '2025-01-01', 90000, 19000, 165000),
(10, 2, 2, '2025-01-01', 90000, 31000, 185000),
(11, 2, 3, '2025-01-01', 90000, 11000, 85000),
(12, 2, 5, '2025-01-01', 90000, 9000, 65000),
(13, 2, 6, '2025-01-01', 90000, 7000, 55000),
(14, 2, 1, '2025-02-01', 95000, 20500, 172000),
(15, 2, 2, '2025-02-01', 95000, 32500, 190000),
(16, 2, 3, '2025-02-01', 95000, 11500, 88000);
GO

SELECT * FROM Fact_Refining;
GO
USE Gulf_Refinery_Analytics;
GO

CREATE TABLE Fact_Product_Sales (
    Sales_ID INT PRIMARY KEY,
    Refinery_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Sales_Date DATE NOT NULL,
    Sales_Volume_Barrels DECIMAL(18,2),
    Selling_Price_USD_Per_Barrel DECIMAL(18,2),
    FOREIGN KEY (Refinery_ID)
        REFERENCES Dim_Refinery(Refinery_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Dim_Product(Product_ID)
);
GO
USE Gulf_Refinery_Analytics;
GO

INSERT INTO Fact_Product_Sales (
    Sales_ID,
    Refinery_ID,
    Product_ID,
    Sales_Date,
    Sales_Volume_Barrels,
    Selling_Price_USD_Per_Barrel
)
VALUES
(1, 1, 1, '2025-01-15', 20000, 95),
(2, 1, 2, '2025-01-15', 32000, 90),
(3, 1, 3, '2025-01-15', 11000, 105),
(4, 1, 5, '2025-01-15', 9000, 75),
(5, 1, 6, '2025-01-15', 7000, 65),
(6, 1, 1, '2025-02-15', 22000, 97),
(7, 1, 2, '2025-02-15', 34000, 92),
(8, 1, 3, '2025-02-15', 12000, 108),
(9, 2, 1, '2025-01-15', 18000, 94),
(10, 2, 2, '2025-01-15', 28000, 89),
(11, 2, 3, '2025-01-15', 10000, 104),
(12, 2, 5, '2025-01-15', 8000, 74),
(13, 2, 6, '2025-01-15', 6000, 64),
(14, 2, 1, '2025-02-15', 19000, 96),
(15, 2, 2, '2025-02-15', 30000, 91),
(16, 2, 3, '2025-02-15', 10500, 107);
GO

SELECT * FROM Fact_Product_Sales;
GO
USE Gulf_Refinery_Analytics;
GO

CREATE TABLE Fact_Operating_Costs (
    Cost_ID INT PRIMARY KEY,
    Refinery_ID INT NOT NULL,
    Cost_Date DATE NOT NULL,
    Cost_Category VARCHAR(50),
    Cost_Amount_USD DECIMAL(18,2),
    FOREIGN KEY (Refinery_ID)
        REFERENCES Dim_Refinery(Refinery_ID)
);
GO

USE Gulf_Refinery_Analytics;
GO

CREATE VIEW VW_Product_Yield_Analysis AS
SELECT
    r.Refinery_ID,
    f.Refinery_Name,
    f.Country,
    p.Product_ID,
    p.Product_Name,
    YEAR(r.Refining_Date) AS Refining_Year,
    MONTH(r.Refining_Date) AS Refining_Month,
    MAX(r.Crude_Input_Barrels) AS Crude_Input_Barrels,
    SUM(r.Product_Output_Barrels) AS Product_Output_Barrels,
    CAST(
        SUM(r.Product_Output_Barrels) * 100.0
        / NULLIF(MAX(r.Crude_Input_Barrels), 0)
        AS DECIMAL(10,2)
    ) AS Product_Yield_Pct,
    SUM(r.Processing_Cost_USD) AS Processing_Cost_USD
FROM Fact_Refining r
INNER JOIN Dim_Refinery f
    ON r.Refinery_ID = f.Refinery_ID
INNER JOIN Dim_Product p
    ON r.Product_ID = p.Product_ID
GROUP BY
    r.Refinery_ID,
    f.Refinery_Name,
    f.Country,
    p.Product_ID,
    p.Product_Name,
    YEAR(r.Refining_Date),
    MONTH(r.Refining_Date);
GO

SELECT *
FROM VW_Product_Yield_Analysis
ORDER BY Refinery_ID, Refining_Year, Refining_Month, Product_ID;
GO

USE Gulf_Refinery_Analytics;
GO

CREATE VIEW VW_Product_Sales_Analysis AS
SELECT
    s.Refinery_ID,
    r.Refinery_Name,
    r.Country,
    p.Product_ID,
    p.Product_Name,
    YEAR(s.Sales_Date) AS Sales_Year,
    MONTH(s.Sales_Date) AS Sales_Month,
    SUM(s.Sales_Volume_Barrels) AS Total_Sales_Volume,
    AVG(s.Selling_Price_USD_Per_Barrel) AS Avg_Selling_Price_USD,
    SUM(
        s.Sales_Volume_Barrels
        * s.Selling_Price_USD_Per_Barrel
    ) AS Total_Revenue_USD
FROM Fact_Product_Sales s
INNER JOIN Dim_Refinery r
    ON s.Refinery_ID = r.Refinery_ID
INNER JOIN Dim_Product p
    ON s.Product_ID = p.Product_ID
GROUP BY
    s.Refinery_ID,
    r.Refinery_Name,
    r.Country,
    p.Product_ID,
    p.Product_Name,
    YEAR(s.Sales_Date),
    MONTH(s.Sales_Date);
GO

SELECT *
FROM VW_Product_Sales_Analysis
ORDER BY Refinery_ID, Sales_Year, Sales_Month, Product_ID;
GO

USE Gulf_Refinery_Analytics;
GO

CREATE VIEW VW_Refinery_Profitability AS
WITH Sales AS (
    SELECT
        Refinery_ID,
        YEAR(Sales_Date) AS Report_Year,
        MONTH(Sales_Date) AS Report_Month,
        SUM(
            Sales_Volume_Barrels
            * Selling_Price_USD_Per_Barrel
        ) AS Total_Revenue_USD
    FROM Fact_Product_Sales
    GROUP BY
        Refinery_ID,
        YEAR(Sales_Date),
        MONTH(Sales_Date)
),
Processing AS (
    SELECT
        Refinery_ID,
        YEAR(Refining_Date) AS Report_Year,
        MONTH(Refining_Date) AS Report_Month,
        SUM(Processing_Cost_USD) AS Total_Processing_Cost_USD
    FROM Fact_Refining
    GROUP BY
        Refinery_ID,
        YEAR(Refining_Date),
        MONTH(Refining_Date)
),
Operating AS (
    SELECT
        Refinery_ID,
        YEAR(Cost_Date) AS Report_Year,
        MONTH(Cost_Date) AS Report_Month,
        SUM(Cost_Amount_USD) AS Total_Operating_Cost_USD
    FROM Fact_Operating_Costs
    GROUP BY
        Refinery_ID,
        YEAR(Cost_Date),
        MONTH(Cost_Date)
)
SELECT
    s.Refinery_ID,
    r.Refinery_Name,
    r.Country,
    s.Report_Year,
    s.Report_Month,
    s.Total_Revenue_USD,
    COALESCE(p.Total_Processing_Cost_USD, 0)
        AS Total_Processing_Cost_USD,
    COALESCE(o.Total_Operating_Cost_USD, 0)
        AS Total_Operating_Cost_USD,
    s.Total_Revenue_US

    USE Gulf_Refinery_Analytics;
GO

CREATE OR ALTER VIEW VW_Refinery_Profitability AS

WITH Sales AS (
    SELECT
        Refinery_ID,
        YEAR(Sales_Date) AS Report_Year,
        MONTH(Sales_Date) AS Report_Month,
        SUM(Sales_Volume_Barrels * Selling_Price_USD_Per_Barrel)
            AS Total_Revenue_USD
    FROM Fact_Product_Sales
    GROUP BY
        Refinery_ID,
        YEAR(Sales_Date),
        MONTH(Sales_Date)
),
Processing AS (
    SELECT
        Refinery_ID,
        YEAR(Refining_Date) AS Report_Year,
        MONTH(Refining_Date) AS Report_Month,
        SUM(Processing_Cost_USD) AS Total_Processing_Cost_USD
    FROM Fact_Refining
    GROUP BY
        Refinery_ID,
        YEAR(Refining_Date),
        MONTH(Refining_Date)
),
Operating AS (
    SELECT
        Refinery_ID,
        YEAR(Cost_Date) AS Report_Year,
        MONTH(Cost_Date) AS Report_Month,
        SUM(Cost_Amount_USD) AS Total_Operating_Cost_USD
    FROM Fact_Operating_Costs
    GROUP BY
        Refinery_ID,
        YEAR(Cost_Date),
        MONTH(Cost_Date)
)

SELECT
    Sales.Refinery_ID,
    Dim_Refinery.Refinery_Name,
    Dim_Refinery.Country,
    Sales.Report_Year,
    Sales.Report_Month,
    Sales.Total_Revenue_USD,

    COALESCE(Processing.Total_Processing_Cost_USD, 0)
        AS Total_Processing_Cost_USD,

    COALESCE(Operating.Total_Operating_Cost_USD, 0)
        AS Total_Operating_Cost_USD,

    Sales.Total_Revenue_USD
        - COALESCE(Processing.Total_Processing_Cost_USD, 0)
        - COALESCE(Operating.Total_Operating_Cost_USD, 0)
        AS Estimated_Operating_Profit_USD,

    CAST(
        (
            Sales.Total_Revenue_USD
            - COALESCE(Processing.Total_Processing_Cost_USD, 0)
            - COALESCE(Operating.Total_Operating_Cost_USD, 0)
        ) * 100.0 / NULLIF(Sales.Total_Revenue_USD, 0)
        AS DECIMAL(10,2)
    ) AS Estimated_Operating_Margin_Pct

FROM Sales
INNER JOIN Dim_Refinery
    ON Sales.Refinery_ID = Dim_Refinery.Refinery_ID

LEFT JOIN Processing
    ON Sales.Refinery_ID = Processing.Refinery_ID
    AND Sales.Report_Year = Processing.Report_Year
    AND Sales.Report_Month = Processing.Report_Month

LEFT JOIN Operating
    ON Sales.Refinery_ID = Operating.Refinery_ID
    AND Sales.Report_Year = Operating.Report_Year
    AND Sales.Report_Month = Operating.Report_Month;
GO

SELECT *
FROM VW_Refinery_Profitability
ORDER BY Refinery_ID, Report_Year, Report_Month;
GO
USE Gulf_Refinery_Analytics;
GO

CREATE VIEW VW_Product_Gross_Profitability AS

WITH Sales AS (
    SELECT
        Refinery_ID,
        Product_ID,
        YEAR(Sales_Date) AS Report_Year,
        MONTH(Sales_Date) AS Report_Month,
        SUM(Sales_Volume_Barrels * Selling_Price_USD_Per_Barrel)
            AS Product_Revenue_USD
    FROM Fact_Product_Sales
    GROUP BY
        Refinery_ID,
        Product_ID,
        YEAR(Sales_Date),
        MONTH(Sales_Date)
),
Processing AS (
    SELECT
        Refinery_ID,
        Product_ID,
        YEAR(Refining_Date) AS Report_Year,
        MONTH(Refining_Date) AS Report_Month,
        SUM(Processing_Cost_USD) AS Product_Processing_Cost_USD
    FROM Fact_Refining
    GROUP BY
        Refinery_ID,
        Product_ID,
        YEAR(Refining_Date),
        MONTH(Refining_Date)
)

SELECT
    Sales.Refinery_ID,
    Dim_Refinery.Refinery_Name,
    Dim_Refinery.Country,
    Sales.Product_ID,
    Dim_Product.Product_Name,
    Sales.Report_Year,
    Sales.Report_Month,
    Sales.Product_Revenue_USD,
    COALESCE(Processing.Product_Processing_Cost_USD, 0)
        AS Product_Processing_Cost_USD,

    Sales.Product_Revenue_USD
        - COALESCE(Processing.Product_Processing_Cost_USD, 0)
        AS Estimated_Gross_Profit_USD,

    CAST(
        (
            Sales.Product_Revenue_USD
            - COALESCE(Processing.Product_Processing_Cost_USD, 0)
        ) * 100.0
        / NULLIF(Sales.Product_Revenue_USD, 0)
        AS DECIMAL(10,2)
    ) AS Estimated_Gross_Margin_Pct

FROM Sales
INNER JOIN Dim_Refinery
    ON Sales.Refinery_ID = Dim_Refinery.Refinery_ID
INNER JOIN Dim_Product
    ON Sales.Product_ID = Dim_Product.Product_ID
LEFT JOIN Processing
    ON Sales.Refinery_ID = Processing.Refinery_ID
    AND Sales.Product_ID = Processing.Product_ID
    AND Sales.Report_Year = Processing.Report_Year
    AND Sales.Report_Month = Processing.Report_Month;
GO

SELECT *
FROM VW_Product_Gross_Profitability
ORDER BY Refinery_ID, Report_Year, Report_Month, Product_ID;
GO


USE Gulf_Refinery_Analytics;
GO

SELECT 'Product Yield' AS View_Name, COUNT(*) AS Total_Rows
FROM VW_Product_Yield_Analysis

UNION ALL

SELECT 'Product Sales', COUNT(*)
FROM VW_Product_Sales_Analysis

UNION ALL

SELECT 'Refinery Profitability', COUNT(*)
FROM VW_Refinery_Profitability

UNION ALL

SELECT 'Product Gross Profitability', COUNT(*)
FROM VW_Product_Gross_Profitability;
GO

USE Gulf_Refinery_Analytics;
GO

SELECT 'Dim_Refinery' AS Table_Name, COUNT(*) AS Total_Rows
FROM Dim_Refinery

UNION ALL

SELECT 'Dim_Product', COUNT(*)
FROM Dim_Product

UNION ALL

SELECT 'Fact_Refining', COUNT(*)
FROM Fact_Refining

UNION ALL

SELECT 'Fact_Product_Sales', COUNT(*)
FROM Fact_Product_Sales

UNION ALL

SELECT 'Fact_Operating_Costs', COUNT(*)
FROM Fact_Operating_Costs;
GO