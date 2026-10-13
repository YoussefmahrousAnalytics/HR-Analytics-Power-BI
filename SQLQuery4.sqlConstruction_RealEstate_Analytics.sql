CREATE DATABASE Construction_RealEstate_Analytics;
GO

USE Construction_RealEstate_Analytics;
GO
USE Construction_RealEstate_Analytics;
GO

CREATE TABLE Projects (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Company VARCHAR(100),
    Project_Type VARCHAR(50),
    City VARCHAR(50),
    Start_Date DATE,
    Planned_End_Date DATE,
    Actual_End_Date DATE,
    Budget DECIMAL(18,2),
    Actual_Cost DECIMAL(18,2)
);

CREATE TABLE Contractors (
    Contractor_ID INT PRIMARY KEY,
    Contractor_Name VARCHAR(100),
    Category VARCHAR(50),
    Rating DECIMAL(3,2)
);

CREATE TABLE Materials (
    Material_ID INT PRIMARY KEY,
    Material_Name VARCHAR(100),
    Quantity DECIMAL(18,2),
    Unit_Cost DECIMAL(18,2),
    Total_Cost DECIMAL(18,2)
);

CREATE TABLE Project_Progress (
    Date DATE,
    Project_ID INT,
    Completion_Percentage DECIMAL(5,2),
    Labor_Count INT,
    Equipment_Hours DECIMAL(10,2),
    Daily_Cost DECIMAL(18,2)
);

CREATE TABLE Sales (
    Unit_ID INT PRIMARY KEY,
    Project_ID INT,
    Unit_Type VARCHAR(50),
    Area DECIMAL(10,2),
    Price DECIMAL(18,2),
    Customer_Type VARCHAR(50)
);
GO
USE Construction_RealEstate_Analytics;
GO

BULK INSERT Projects
FROM 'C:\Construction_RealEstate_Analytics\Projects.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Contractors
FROM 'C:\Construction_RealEstate_Analytics\Contractors.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Materials
FROM 'C:\Construction_RealEstate_Analytics\Materials.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Project_Progress
FROM 'C:\Construction_RealEstate_Analytics\Project_Progress.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Sales
FROM 'C:\Construction_RealEstate_Analytics\Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Construction_RealEstate_Analytics;
GO

BULK INSERT Projects
FROM 'C:\Projects.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Contractors
FROM 'C:\Contractors.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Materials
FROM 'C:\Materials.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Project_Progress
FROM 'C:\Project_Progress.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Sales
FROM 'C:\Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Construction_RealEstate_Analytics;
GO

DROP TABLE IF EXISTS Project_Progress;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Projects;
GO

CREATE TABLE Projects (
    Project_ID VARCHAR(20) PRIMARY KEY,
    Project_Name VARCHAR(100),
    Company VARCHAR(100),
    Project_Type VARCHAR(50),
    City VARCHAR(50),
    Start_Date DATE,
    Planned_End_Date DATE,
    Actual_End_Date DATE,
    Budget DECIMAL(18,2),
    Actual_Cost DECIMAL(18,2)
);

CREATE TABLE Project_Progress (
    Date DATE,
    Project_ID VARCHAR(20),
    Completion_Percentage DECIMAL(5,2),
    Labor_Count INT,
    Equipment_Hours DECIMAL(10,2),
    Daily_Cost DECIMAL(18,2)
);

CREATE TABLE Sales (
    Unit_ID VARCHAR(20) PRIMARY KEY,
    Project_ID VARCHAR(20),
    Unit_Type VARCHAR(50),
    Area DECIMAL(10,2),
    Price DECIMAL(18,2),
    Customer_Type VARCHAR(50)
);
GO
USE Construction_RealEstate_Analytics;
GO

BULK INSERT Projects
FROM 'C:\Projects.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Contractors
FROM 'C:\Contractors.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Materials
FROM 'C:\Materials.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Project_Progress
FROM 'C:\Project_Progress.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Sales
FROM 'C:\Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Construction_RealEstate_Analytics;
GO

DROP TABLE Projects;
GO

CREATE TABLE Projects (
    Project_ID VARCHAR(20) PRIMARY KEY,
    Project_Name VARCHAR(100),
    Company VARCHAR(100),
    Project_Type VARCHAR(50),
    City VARCHAR(50),
    Start_Date VARCHAR(20),
    Planned_End_Date VARCHAR(20),
    Actual_End_Date VARCHAR(20),
    Budget DECIMAL(18,2),
    Actual_Cost DECIMAL(18,2)
);
GO
USE Construction_RealEstate_Analytics;
GO

BULK INSERT Contractors
FROM 'C:\Contractors.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Materials
FROM 'C:\Materials.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Project_Progress
FROM 'C:\Project_Progress.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Sales
FROM 'C:\Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Construction_RealEstate_Analytics;
GO

DROP TABLE IF EXISTS Contractors;
GO
USE Construction_RealEstate_Analytics;
GO

BULK INSERT Materials
FROM 'C:\Materials.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Project_Progress
FROM 'C:\Project_Progress.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Sales
FROM 'C:\Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Construction_RealEstate_Analytics;
GO

DROP TABLE Materials;
GO

CREATE TABLE Materials (
    Material_ID VARCHAR(20) PRIMARY KEY,
    Material_Name VARCHAR(100),
    Quantity DECIMAL(18,2),
    Unit_Cost DECIMAL(18,2),
    Total_Cost DECIMAL(18,2)
);
GO
USE Construction_RealEstate_Analytics;
GO

BULK INSERT Project_Progress
FROM 'C:\Project_Progress.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Construction_RealEstate_Analytics;
GO

BULK INSERT Sales
FROM 'C:\Sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Construction_RealEstate_Analytics;
GO

SELECT 'Projects' AS Table_Name, COUNT(*) AS Row_Count
FROM Projects

UNION ALL

SELECT 'Materials', COUNT(*)
FROM Materials

UNION ALL

SELECT 'Project_Progress', COUNT(*)
FROM Project_Progress;
GO