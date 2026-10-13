CREATE DATABASE Marketing_Advertising_Analytics;
GO

USE Marketing_Advertising_Analytics;
GO
USE Marketing_Advertising_Analytics;
GO

CREATE TABLE Campaigns (
    Campaign_ID INT PRIMARY KEY,
    Campaign_Name VARCHAR(100),
    Campaign_Type VARCHAR(50),
    Platform VARCHAR(50),
    Start_Date DATE,
    End_Date DATE,
    Budget DECIMAL(12,2),
    Target_Audience VARCHAR(100)
);

CREATE TABLE Ad_Performance (
    Performance_ID INT PRIMARY KEY,
    Campaign_ID INT,
    Date DATE,
    Impressions INT,
    Clicks INT,
    Conversions INT,
    Spend DECIMAL(12,2),
    Revenue DECIMAL(12,2)
);

CREATE TABLE Leads (
    Lead_ID INT PRIMARY KEY,
    Campaign_ID INT,
    Lead_Date DATE,
    Lead_Source VARCHAR(50),
    Lead_Status VARCHAR(50),
    Conversion_Value DECIMAL(12,2)
);

CREATE TABLE Date (
    Date DATE PRIMARY KEY,
    Year INT,
    Month INT,
    Month_Name VARCHAR(20),
    Quarter VARCHAR(10)
);
GO
USE Marketing_Advertising_Analytics;
GO

BULK INSERT Campaigns
FROM 'C:\Marketing_Advertising_Analytics\Campaigns.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Ad_Performance
FROM 'C:\Marketing_Advertising_Analytics\Ad_Performance.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Leads
FROM 'C:\Marketing_Advertising_Analytics\Leads.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Date
FROM 'C:\Marketing_Advertising_Analytics\Date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Marketing_Advertising_Analytics;
GO

BULK INSERT Campaigns
FROM 'C:\Campaigns.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Ad_Performance
FROM 'C:\Ad_Performance.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Leads
FROM 'C:\Leads.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

BULK INSERT Date
FROM 'C:\Date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Marketing_Advertising_Analytics;
GO

TRUNCATE TABLE Campaigns;
TRUNCATE TABLE Ad_Performance;
TRUNCATE TABLE Leads;
TRUNCATE TABLE Date;
GO
USE Marketing_Advertising_Analytics;
GO

ALTER TABLE Campaigns
ALTER COLUMN Campaign_ID VARCHAR(20) NOT NULL;
GO
USE Marketing_Advertising_Analytics;
GO

DROP TABLE Campaigns;
GO

CREATE TABLE Campaigns (
    Campaign_ID VARCHAR(50) PRIMARY KEY,
    Campaign_Name VARCHAR(100),
    Campaign_Type VARCHAR(50),
    Platform VARCHAR(50),
    Start_Date DATE,
    End_Date DATE,
    Budget DECIMAL(12,2),
    Target_Audience VARCHAR(100)
);
GO

BULK INSERT Campaigns
FROM 'C:\Campaigns.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Marketing_Advertising_Analytics;
GO

DROP TABLE Campaigns;
GO

CREATE TABLE Campaigns (
    Campaign_ID VARCHAR(50) PRIMARY KEY,
    Campaign_Name VARCHAR(100),
    Campaign_Type VARCHAR(50),
    Platform VARCHAR(50),
    Start_Date VARCHAR(30),
    End_Date VARCHAR(30),
    Budget VARCHAR(30),
    Target_Audience VARCHAR(100)
);
GO

BULK INSERT Campaigns
FROM 'C:\Campaigns.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Marketing_Advertising_Analytics;
GO

DROP TABLE IF EXISTS Ad_Performance;
GO

CREATE TABLE Ad_Performance (
    Performance_ID VARCHAR(50),
    Campaign_ID VARCHAR(50),
    Date VARCHAR(30),
    Impressions VARCHAR(30),
    Clicks VARCHAR(30),
    Conversions VARCHAR(30),
    Spend VARCHAR(30),
    Revenue VARCHAR(30)
);
GO

BULK INSERT Ad_Performance
FROM 'C:\Ad_Performance.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Marketing_Advertising_Analytics;
GO

DROP TABLE IF EXISTS Leads;
GO

CREATE TABLE Leads (
    Lead_ID VARCHAR(50),
    Campaign_ID VARCHAR(50),
    Lead_Date VARCHAR(30),
    Lead_Source VARCHAR(50),
    Lead_Status VARCHAR(50),
    Conversion_Value VARCHAR(30)
);
GO

BULK INSERT Leads
FROM 'C:\Leads.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Marketing_Advertising_Analytics;
GO

DROP TABLE IF EXISTS Date;
GO

CREATE TABLE Date (
    Date VARCHAR(30),
    Year VARCHAR(10),
    Month VARCHAR(10),
    Month_Name VARCHAR(20),
    Quarter VARCHAR(10)
);
GO

BULK INSERT Date
FROM 'C:\Date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO
USE Marketing_Advertising_Analytics;
GO

DROP TABLE IF EXISTS Date;
GO

CREATE TABLE Date (
    Date VARCHAR(30),
    Year VARCHAR(10),
    Month VARCHAR(10),
    Month_Name VARCHAR(30),
    Quarter VARCHAR(30)
);
GO

BULK INSERT Date
FROM 'C:\Date.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);
GO