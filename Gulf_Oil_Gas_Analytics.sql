USE Gulf_Oil_Gas_Analytics;
GO

INSERT INTO Fact_Quality (
    Quality_Check_ID,
    Site_ID,
    Check_Date,
    Product_Name,
    Units_Inspected,
    Defect_Rate_Pct,
    Defect_Units,
    Inspection_Result
)
SELECT
    Quality_Check_ID,
    Site_ID,
    TRY_CONVERT(DATE, Check_Date),
    Product_Name,
    TRY_CONVERT(INT, Units_Inspected),
    TRY_CONVERT(DECIMAL(10,2), Defect_Rate_Pct),
    TRY_CONVERT(INT, Defect_Units),
    Inspection_Result
FROM Fact_Quality_Import;
GO

USE Gulf_Oil_Gas_Analytics;
GO

SELECT
    COUNT(*) AS Total_Quality_Records,
    MIN(Check_Date) AS First_Check_Date,
    MAX(Check_Date) AS Last_Check_Date
FROM Fact_Quality;
GO

USE Gulf_Oil_Gas_Analytics;
GO

SELECT DISTINCT S.Sales_Date
FROM Fact_Sales_Import AS S
LEFT JOIN Dim_Date AS D
    ON TRY_CONVERT(DATE, S.Sales_Date) = D.[Date]
WHERE D.[Date] IS NULL
  AND TRY_CONVERT(DATE, S.Sales_Date) IS NOT NULL;
GO

USE Gulf_Oil_Gas_Analytics;
GO

INSERT INTO Fact_Sales (
    Sales_ID,
    Site_ID,
    Sales_Date,
    Product_ID,
    Sales_Volume_Units,
    Price_USD_per_Unit,
    Revenue_USD,
    Sales_Channel,
    Contract_Type
)
SELECT
    Sales_ID,
    Site_ID,
    TRY_CONVERT(DATE, Sales_Date),
    Product_ID,
    TRY_CONVERT(DECIMAL(18,2), Sales_Volume_Units),
    TRY_CONVERT(DECIMAL(18,2), Price_USD_per_Unit),
    TRY_CONVERT(DECIMAL(18,2), Revenue_USD),
    Sales_Channel,
    Contract_Type
FROM Fact_Sales_Import;
GO

SELECT COUNT(*) AS Total_Sales_Records
FROM Fact_Sales;
GO

USE Gulf_Oil_Gas_Analytics;
GO

SELECT 'Dim_Site' AS Table_Name, COUNT(*) AS Total_Rows FROM Dim_Site
UNION ALL
SELECT 'Dim_Date', COUNT(*) FROM Dim_Date
UNION ALL
SELECT 'Dim_Product', COUNT(*) FROM Dim_Product
UNION ALL
SELECT 'Fact_Production', COUNT(*) FROM Fact_Production
UNION ALL
SELECT 'Fact_Maintenance', COUNT(*) FROM Fact_Maintenance
UNION ALL
SELECT 'Fact_Incidents', COUNT(*) FROM Fact_Incidents
UNION ALL
SELECT 'Fact_Quality', COUNT(*) FROM Fact_Quality
UNION ALL
SELECT 'Fact_Sales', COUNT(*) FROM Fact_Sales;
GO

USE Gulf_Oil_Gas_Analytics;
GO

SELECT 'Dim_Site' AS Table_Name, COUNT(*) AS Total_Rows FROM Dim_Site
UNION ALL
SELECT 'Dim_Date', COUNT(*) FROM Dim_Date
UNION ALL
SELECT 'Dim_Product', COUNT(*) FROM Dim_Product
UNION ALL
SELECT 'Fact_Production', COUNT(*) FROM Fact_Production
UNION ALL
SELECT 'Fact_Maintenance', COUNT(*) FROM Fact_Maintenance
UNION ALL
SELECT 'Fact_Incidents', COUNT(*) FROM Fact_Incidents
UNION ALL
SELECT 'Fact_Quality', COUNT(*) FROM Fact_Quality
UNION ALL
SELECT 'Fact_Sales', COUNT(*) FROM Fact_Sales;
GO