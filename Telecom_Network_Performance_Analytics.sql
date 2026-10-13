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