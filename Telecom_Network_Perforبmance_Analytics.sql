ALTER TABLE Tower
ADD Tower_Type VARCHAR(30),
    Capacity_Users INT;
GO
INSERT INTO Tower (
    Tower_ID,
    Region,
    City,
    Tower_Type,
    Technology,
    Latitude,
    Longitude,
    Capacity_Users
)
SELECT
    Tower_ID,
    Region,
    City,
    Tower_Type,
    Technology,
    Latitude,
    Longitude,
    Capacity_Users
FROM Tower_Import;
GO
ALTER TABLE Tower
DROP CONSTRAINT PK__Tower;
SELECT name
FROM sys.key_constraints
WHERE parent_object_id = OBJECT_ID('Tower')
  AND type = 'PK';
  ALTER TABLE Tower
DROP CONSTRAINT PK__Tower__1EB25855BC0D8B75;
GO
SELECT
    fk.name AS Foreign_Key_Name,
    OBJECT_NAME(fk.parent_object_id) AS Child_Table
FROM sys.foreign_keys fk
WHERE fk.referenced_object_id = OBJECT_ID('Tower');
ALTER TABLE Network_KPI
DROP CONSTRAINT FK__Network_K__Tower__4CA06362;
GO

ALTER TABLE Incidents
DROP CONSTRAINT FK__Incidents__Tower__4F7CD00D;
GO

ALTER TABLE Customer_Complaints
DROP CONSTRAINT FK__Customer___Tower__52593CB8;
GO

ALTER TABLE Maintenance
DROP CONSTRAINT FK__Maintenan__Tower__5535A963;
GO
ALTER TABLE Tower
DROP CONSTRAINT PK__Tower__1EB25855BC0D8B75;
GO
ALTER TABLE Tower
ADD CONSTRAINT PK_Tower PRIMARY KEY (Tower_ID);
GO
ALTER TABLE Network_KPI
ALTER COLUMN Tower_ID VARCHAR(20);
GO

ALTER TABLE Incidents
ALTER COLUMN Tower_ID VARCHAR(20);
GO

ALTER TABLE Customer_Complaints
ALTER COLUMN Tower_ID VARCHAR(20);
GO

ALTER TABLE Maintenance
ALTER COLUMN Tower_ID VARCHAR(20);
GO
ALTER TABLE Network_KPI
ADD CONSTRAINT FK_Network_KPI_Tower
FOREIGN KEY (Tower_ID) REFERENCES Tower(Tower_ID);
GO

ALTER TABLE Incidents
ADD CONSTRAINT FK_Incidents_Tower
FOREIGN KEY (Tower_ID) REFERENCES Tower(Tower_ID);
GO

ALTER TABLE Customer_Complaints
ADD CONSTRAINT FK_Customer_Complaints_Tower
FOREIGN KEY (Tower_ID) REFERENCES Tower(Tower_ID);
GO

ALTER TABLE Maintenance
ADD CONSTRAINT FK_Maintenance_Tower
FOREIGN KEY (Tower_ID) REFERENCES Tower(Tower_ID);
GO
INSERT INTO Tower (
    Tower_ID,
    Region,
    City,
    Tower_Type,
    Technology,
    Latitude,
    Longitude,
    Capacity_Users
)
SELECT
    Tower_ID,
    Region,
    City,
    Tower_Type,
    Technology,
    Latitude,
    Longitude,
    Capacity_Users
FROM Tower_Import;
GO
SELECT TOP 10 *
FROM Tower
ORDER BY Tower_ID;
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Network_KPI_Import'
ORDER BY ORDINAL_POSITION;
ALTER TABLE Network_KPI
ADD Active_Users INT,
    Traffic_GB DECIMAL(12,2),
    Availability_PCT DECIMAL(5,2),
    Downtime_MIN DECIMAL(10,2),
    Handover_Success_PCT DECIMAL(5,2),
    Major_Incident VARCHAR(20);
GO
ALTER TABLE Network_KPI
DROP CONSTRAINT PK__Network_K__;
SELECT name
FROM sys.key_constraints
WHERE parent_object_id = OBJECT_ID('Network_KPI')
  AND type = 'PK';
ALTER TABLE Network_KPI
DROP CONSTRAINT PK__Network___CEC470B82318A22D;
GO
ALTER TABLE Network_KPI
ALTER COLUMN KPI_ID VARCHAR(20) NOT NULL;
GO
ALTER TABLE Network_KPI
ADD CONSTRAINT PK_Network_KPI PRIMARY KEY (KPI_ID);
GO
ALTER TABLE Network_KPI
ALTER COLUMN Tower_ID VARCHAR(20);
GO
ALTER TABLE Network_KPI
ADD CONSTRAINT FK_Network_KPI_Tower
FOREIGN KEY (Tower_ID) REFERENCES Tower(Tower_ID);
GO
SELECT
    fk.name AS Foreign_Key_Name,
    OBJECT_NAME(fk.parent_object_id) AS Child_Table,
    OBJECT_NAME(fk.referenced_object_id) AS Parent_Table
FROM sys.foreign_keys fk
WHERE fk.name = 'FK_Network_KPI_Tower';
INSERT INTO Network_KPI (
    KPI_ID,
    Tower_ID,
    Active_Users,
    Traffic_GB,
    Availability_PCT,
    Downtime_MIN,
    Handover_Success_PCT,
    Download_Speed_Mbps,
    Upload_Speed_Mbps,
    Latency_ms,
    Major_Incident
)
SELECT
    KPI_ID,
    Tower_ID,
    Active_Users,
    Traffic_GB,
    Availability_BCT,
    Down_time_MIN,
    Handover_success_BCT,
    Download_Mbps,
    Upload_Mbps,
    Latency_MS,
    Major_incident
FROM Network_KPI_Import;
GO
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Network_KPI_Import'
ORDER BY ORDINAL_POSITION;
INSERT INTO Network_KPI (
    KPI_ID,
    Tower_ID,
    Active_Users,
    Traffic_GB,
    Availability_PCT,
    Downtime_MIN,
    Handover_Success_PCT,
    Download_Speed_Mbps,
    Upload_Speed_Mbps,
    Latency_ms,
    Major_Incident
)
SELECT
    [KPI_ID],
    [Tower_ID],
    [Active_Users],
    [Traffic_GB],
    [Availability BCT],
    [Down time MIN],
    [Handover success BCT],
    [Download Mbps],
    [Upload Mbps],
    [Latency MS],
    [Major incident]
FROM Network_KPI_Import;
GO
INSERT INTO Network_KPI (
    KPI_ID,
    Tower_ID,
    Active_Users,
    Traffic_GB,
    Availability_PCT,
    Downtime_MIN,
    Handover_Success_PCT,
    Download_Speed_Mbps,
    Upload_Speed_Mbps,
    Latency_ms,
    Major_Incident
)
SELECT
    [KPI_ID],
    [Tower_ID],
    [Active_Users],
    [Traffic_GB],
    [Availability BCT],
    [Down time MIN],
    [Handover success BCT],
    [Download Mbps],
    [Upload Mbps],
    [Latency MS],
    [Major incident]
FROM Network_KPI_Import;
GO
SELECT 
    column_id,
    name
FROM sys.columns
WHERE object_id = OBJECT_ID('Network_KPI_Import')
ORDER BY column_id;
ALTER TABLE Network_KPI
ADD KPI_Date DATE,
    Dropped_Calls INT;
GO
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Network_KPI'
ORDER BY ORDINAL_POSITION;
INSERT INTO Network_KPI (
    KPI_ID,
    Tower_ID,
    KPI_Date,
    Active_Users,
    Traffic_GB,
    Availability_PCT,
    Downtime_MIN,
    Dropped_Calls,
    Handover_Success_PCT,
    Download_Speed_Mbps,
    Upload_Speed_Mbps,
    Latency_ms,
    Major_Incident
)
SELECT
    [KPI_ID],
    [Tower_ID],
    [Date],
    [Active_Users],
    [Traffic_GB],
    [Availability_BCT],
    [Downtime_MIN],
    [Dropped_Calls],
    [Handover_Success_BCT],
    [Download_Mbps],
    [Upload_Mbps],
    [Latency_MS],
    [Major_Incident]
FROM Network_KPI_Import;
GO
SELECT column_id, name
FROM sys.columns
WHERE object_id = OBJECT_ID('Network_KPI_Import')
ORDER BY column_id;
INSERT INTO Network_KPI (
    KPI_ID,
    Tower_ID,
    KPI_Date,
    Active_Users,
    Traffic_GB,
    Availability_PCT,
    Downtime_MIN,
    Dropped_Calls,
    Handover_Success_PCT,
    Download_Speed_Mbps,
    Upload_Speed_Mbps,
    Latency_ms,
    Major_Incident
)
SELECT
    [KPI_ID],
    [Tower_ID],
    [Date],
    [Active_Users],
    [Traffic_GB],
    [Availability_Pct],
    [Downtime_MIN],
    [Dropped_Calls],
    [Handover_Success_Pct],
    [Download_Mbps],
    [Upload_Mbps],
    [Latency_MS],
    [Major_Incident]
FROM Network_KPI_Import;
GO
SELECT COUNT(*) AS Total_KPI_Records
FROM Network_KPI;
SELECT
    column_id,
    name
FROM sys.columns
WHERE object_id = OBJECT_ID('Incidents_Import')
ORDER BY column_id;
SELECT TOP 5 *
FROM Incidents_Import;
SELECT
    TABLE_CATALOG,
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
USE Telecom_Network_Performance_Analytics;
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
USE Telecom_Network_Performance_Analytics;
GO

SELECT TOP 5 *
FROM Incident_Import;
SELECT
    DB_NAME() AS Current_Database,
    name AS Exact_Table_Name
FROM sys.tables
ORDER BY name; 
SELECT
    name,
    QUOTENAME(name) AS Exact_Name
FROM sys.tables
WHERE name LIKE '%Incident%';
SELECT TOP 5 *
FROM dbo.incident_import;
SELECT
    DB_NAME() AS Current_Database,
    s.name AS Schema_Name,
    t.name AS Table_Name
FROM sys.tables AS t
JOIN sys.schemas AS s
    ON t.schema_id = s.schema_id
WHERE t.name LIKE '%incident%';
USE Telecom_Network_Performance_Analytics;
GO

SELECT TOP 5 *
FROM dbo.incidents_import;
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Incidents'
ORDER BY ORDINAL_POSITION;
INSERT INTO Incidents (
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Time_Hours,
    Status
)
SELECT
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Hour,
    Resolved
FROM Incident_Import;
USE Telecom_Network_Performance_Analytics;
GO

SELECT name
FROM sys.tables
WHERE name LIKE '%Incident%';
INSERT INTO Incidents (
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Time_Hours,
    Status
)
SELECT
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Hours,
    Resolved
FROM incidents_import;
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'incidents_import';
INSERT INTO Incidents (
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Time_Hours,
    Status
)
SELECT
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Hours,
    Resolved
FROM incidents_import;
USE Telecom_Network_Performance_Analytics;
GO

ALTER TABLE Incidents
DROP CONSTRAINT FK_Incidents_Tower;
GO

ALTER TABLE Incidents
DROP CONSTRAINT PK_Incidents;
GO
SELECT
    name AS Constraint_Name,
    type_desc AS Constraint_Type
FROM sys.objects
WHERE parent_object_id = OBJECT_ID('Incidents')
  AND type IN ('PK', 'F');
  ALTER TABLE Incidents
DROP CONSTRAINT [PK__Incident__0D4B73C9E3912313];
GO
ALTER TABLE Incidents
ALTER COLUMN Incident_ID VARCHAR(20) NOT NULL;
GO
ALTER TABLE Incidents
ADD CONSTRAINT PK_Incidents
PRIMARY KEY (Incident_ID);
GO
INSERT INTO Incidents (
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Time_Hours,
    Status
)
SELECT
    Incident_ID,
    Tower_ID,
    Incident_Date,
    Incident_Type,
    Severity,
    Resolution_Hours,
    Resolved
FROM incidents_import;
GO
SELECT
    COUNT(*) AS Total_Incidents
FROM Incidents;
SELECT name
FROM sys.tables
WHERE name LIKE '%Complaint%';
SELECT name
FROM sys.tables
WHERE name LIKE '%Complaint%';
SELECT name
FROM sys.tables
WHERE name LIKE '%Complaint%';
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customer_Complaints_Import'
ORDER BY ORDINAL_POSITION;
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customer_Complaints'
ORDER BY ORDINAL_POSITION;
SELECT name
FROM sys.tables
WHERE name LIKE '%Maintenance%';
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Maintenance_Import'
ORDER BY ORDINAL_POSITION;
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Maintenance'
ORDER BY ORDINAL_POSITION;
SELECT TOP 5 *
FROM Maintenance_Import;
SELECT TOP 10
    Maintenance_ID,
    Tower_ID,
    Duration_Hours,
    Cost_EGP
FROM Maintenance_Import;
SELECT
    name AS Constraint_Name,
    type_desc AS Constraint_Type
FROM sys.objects
WHERE parent_object_id = OBJECT_ID('Maintenance')
  AND type = 'PK';
ALTER TABLE Maintenance
DROP CONSTRAINT [PK__Maintena__CCC49F9FC5E18FD2];
ALTER TABLE Maintenance
ALTER COLUMN Maintenance_ID VARCHAR(20) NOT NULL;
GO
ALTER TABLE Maintenance
ADD CONSTRAINT PK_Maintenance
PRIMARY KEY (Maintenance_ID);
GO
SELECT
    COLUMN_NAME,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Maintenance'
ORDER BY ORDINAL_POSITION;
INSERT INTO Maintenance (
    Maintenance_ID,
    Tower_ID,
    Maintenance_Date,
    Maintenance_Type,
    Maintenance_Cost,
    Downtime_Hours,
    Technical_Count
)
SELECT
    Maintenance_ID,
    Tower_ID,
    Maintenance_Date,
    Maintenance_Type,
    Cost_EGP,
    Duration_Hours,
    NULL
FROM Maintenance_Import;
GO
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Maintenance'
ORDER BY ORDINAL_POSITION;
INSERT INTO Maintenance (
    Maintenance_ID,
    Tower_ID,
    Maintenance_Date,
    Maintenance_Type,
    Maintenance_Cost,
    Downtime_Hours,
    Technician_Count
)
SELECT
    Maintenance_ID,
    Tower_ID,
    Maintenance_Date,
    Maintenance_Type,
    Cost_EGP,
    Duration_Hours,
    NULL
FROM Maintenance_Import;
GO
SELECT COUNT(*) AS Total_Maintenance_Records
FROM Maintenance;
SELECT name
FROM sys.tables
WHERE name LIKE '%Date%';
SELECT TOP 5 *
FROM [Date];
SELECT
    COUNT(*) AS Total_Dates,
    MIN([Date]) AS First_Date,
    MAX([Date]) AS Last_Date
FROM [Date];
SELECT
    COUNT(*) AS Total_Dates,
    MIN(Date_Key) AS First_Date,
    MAX(Date_Key) AS Last_Date
FROM [Date];
SELECT
    MIN(KPI_Date) AS First_KPI_Date,
    MAX(KPI_Date) AS Last_KPI_Date,
    COUNT(*) AS Total_Records
FROM Network_KPI;
SELECT
    MIN(KPI_Date) AS First_KPI_Date,
    MAX(KPI_Date) AS Last_KPI_Date,
    COUNT(*) AS Total_Records
FROM Network_KPI;
;WITH DateSeries AS (
    SELECT CAST('2026-01-01' AS DATE) AS DateValue

    UNION ALL

    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateSeries
    WHERE DateValue < '2026-03-31'
)
INSERT INTO [Date] (
    Date_Key,
    Year,
    Quarter,
    Month,
    Month_Name,
    Year_Month
)
SELECT
    DateValue,
    YEAR(DateValue),
    'Q' + CAST(DATEPART(QUARTER, DateValue) AS VARCHAR(1)),
    MONTH(DateValue),
    DATENAME(MONTH, DateValue),
    CONVERT(VARCHAR(7), DateValue, 120)
FROM DateSeries
OPTION (MAXRECURSION 100);
DECLARE @StartDate DATE = '2026-01-01';
DECLARE @EndDate DATE = '2026-03-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO [Date] (
        Date_Key,
        [Year],
        Quarter,
        [Month],
        Month_Name,
        Year_Month
    )
    VALUES (
        @StartDate,
        YEAR(@StartDate),
        'Q' + CAST(DATEPART(QUARTER, @StartDate) AS VARCHAR(1)),
        MONTH(@StartDate),
        DATENAME(MONTH, @StartDate),
        CONVERT(VARCHAR(7), @StartDate, 120)
    );

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;


DECLARE @StartDate DATE = '2026-01-01';
DECLARE @EndDate DATE = '2026-03-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO [Date] (
        Date_Key,
        [Year],
        Quarter,
        [Month],
        Month_Name,
        Year_Month
    )
    VALUES (
        @StartDate,
        YEAR(@StartDate),
        'Q' + CAST(DATEPART(QUARTER, @StartDate) AS VARCHAR(1)),
        MONTH(@StartDate),
        DATENAME(MONTH, @StartDate),
        CONVERT(VARCHAR(7), @StartDate, 120)
    );

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;



SELECT
    COUNT(*) AS Total_Dates,
    MIN(Date_Key) AS First_Date,
    MAX(Date_Key) AS Last_Date
FROM [Date];


SELECT COUNT(*) AS Total_Towers
FROM Tower;


SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Tower_ID) AS Towers_Monitored,
    COUNT(DISTINCT KPI_Date) AS Monitoring_Days
FROM Network_KPI;


SELECT
    COUNT(*) AS Total_Incidents,
    COUNT(DISTINCT Tower_ID) AS Affected_Towers,
    MIN(Incident_Date) AS First_Incident,
    MAX(Incident_Date) AS Last_Incident
FROM Incidents;


SELECT
    COUNT(*) AS Total_Maintenance_Records,
    COUNT(DISTINCT Tower_ID) AS Towers_Maintained,
    MIN(Maintenance_Date) AS First_Maintenance,
    MAX(Maintenance_Date) AS Last_Maintenance
FROM Maintenance;


SELECT
    COUNT(*) AS Total_Records,
    MIN([Date]) AS First_Date,
    MAX([Date]) AS Last_Date,
    SUM(Network_Complaints) AS Total_Network_Complaints,
    SUM(Slow_Internet_Complaints) AS Total_Slow_Internet_Complaints,
    SUM(Dropped_Call_Complaints) AS Total_Dropped_Call_Complaints
FROM Customer_Complaints_Import;


SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Tower_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Tower_ID,
    SUM(CASE WHEN KPI_Date IS NULL THEN 1 ELSE 0 END) AS Missing_KPI_Date,
    SUM(CASE WHEN Availability_PCT IS NULL THEN 1 ELSE 0 END) AS Missing_Availability
FROM Network_KPI;


SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Tower_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Tower_ID,
    SUM(CASE WHEN KPI_Date IS NULL THEN 1 ELSE 0 END) AS Missing_KPI_Date,
    SUM(CASE WHEN Availability_PCT IS NULL THEN 1 ELSE 0 END) AS Missing_Availability
FROM Network_KPI;


SELECT
    COUNT(*) AS Total_Incidents,
    SUM(CASE WHEN Tower_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Tower_ID,
    SUM(CASE WHEN Incident_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Incident_Date,
    SUM(CASE WHEN Severity IS NULL THEN 1 ELSE 0 END) AS Missing_Severity
FROM Incidents;


SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN Tower_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Tower_ID,
    SUM(CASE WHEN Maintenance_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Maintenance_Cost IS NULL THEN 1 ELSE 0 END) AS Missing_Cost
FROM Maintenance;


SELECT
    T.Region,
    COUNT(I.Incident_ID) AS Total_Incidents,
    COUNT(DISTINCT I.Tower_ID) AS Affected_Towers,
    CAST(AVG(I.Resolution_Time_Hours) AS DECIMAL(10,2)) AS Avg_Resolution_Hours
FROM Incidents AS I
INNER JOIN Tower AS T
    ON I.Tower_ID = T.Tower_ID
GROUP BY T.Region
ORDER BY Total_Incidents DESC;


SELECT
    T.Region,
    I.Severity,
    COUNT(*) AS Total_Incidents,
    CAST(
        AVG(I.Resolution_Time_Hours)
        AS DECIMAL(10,2)
    ) AS Avg_Resolution_Hours
FROM Incidents AS I
INNER JOIN Tower AS T
    ON I.Tower_ID = T.Tower_ID
GROUP BY
    T.Region,
    I.Severity
ORDER BY
    T.Region,
    Total_Incidents DESC;


    SELECT
    T.Region,
    COUNT(*) AS Critical_Incidents,
    CAST(
        AVG(I.Resolution_Time_Hours)
        AS DECIMAL(10,2)
    ) AS Avg_Resolution_Hours,
    MAX(I.Resolution_Time_Hours) AS Max_Resolution_Hours
FROM Incidents AS I
INNER JOIN Tower AS T
    ON I.Tower_ID = T.Tower_ID
WHERE I.Severity = 'Critical'
GROUP BY T.Region
ORDER BY Critical_Incidents DESC,
         Avg_Resolution_Hours DESC;