
--TABLES
CREATE TABLE Locations
(
LocationID INT NOT NULL PRIMARY KEY,
Latitude FLOAT,
Longitude FLOAT,
Region VARCHAR(20),
Country VARCHAR(20),
City VARCHAR(20),
);

CREATE TABLE Sensors
(
SensorID INT NOT NULL PRIMARY KEY,
LocationID INT,
InstallationDate DATE,
status VARCHAR(20),
LastUpdated datetime,
FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Readings
(
ReadingID INT NOT NULL PRIMARY KEY,
SensorID INT,
Time TIME,
Date DATE,
FOREIGN KEY (SensorID) REFERENCES Sensors(SensorID)
);

CREATE TABLE AirQualityData
(
ReadingID INT NOT NULL PRIMARY KEY,
Temperature FLOAT,
Humidity FLOAT,
WindSpeed FLOAT,
WindDirection FLOAT,
FOREIGN KEY (ReadingID) REFERENCES Readings(ReadingID)
);

CREATE TABLE WaterQualityData
(
ReadingID INT NOT NULL PRIMARY KEY,
pH FLOAT,
DissolvedOxygen FLOAT,
Turbidity FLOAT,
Conductivity FLOAT,
TotalDissolvedSolids FLOAT,
FOREIGN KEY (ReadingID) REFERENCES Readings(ReadingID)
);

CREATE TABLE SoilQualityData
(
ReadingID INT NOT NULL PRIMARY KEY,
SoilMoisture FLOAT,
NutrientLevels FLOAT,
OrganicMatter FLOAT,
Salinity FLOAT,
BaseSaturation FLOAT,
FOREIGN KEY (ReadingID) REFERENCES Readings(ReadingID)
);

CREATE TABLE Pollutants
(
PollutantID INT NOT NULL PRIMARY KEY,
Name VARCHAR(20),
Description VARCHAR(50),
MeasurementUnit VARCHAR(20),
SafetyThreshold FLOAT
);

CREATE TABLE PollutantData
(
PollutantDataID INT NOT NULL PRIMARY KEY,
ReadingID INT,
PollutantID INT,
Value FLOAT,
FOREIGN KEY (ReadingID) REFERENCES Readings(ReadingID),
FOREIGN KEY (PollutantID) REFERENCES Pollutants(PollutantID)
);

CREATE TABLE NoiseLevelData
(
ReadingID INT NOT NULL PRIMARY KEY,
NoiseLevel INT,
NoiseFrequency FLOAT,
FOREIGN KEY (ReadingID) REFERENCES Readings(ReadingID)
);

CREATE TABLE ALERT
(
AlertID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
PollutantDataID INT,
Reason VARCHAR(20),
Value FLOAT
);

--DISPLAY TABLES

SELECT * FROM Locations
SELECT * FROM Sensors
SELECT * FROM Readings
SELECT * FROM AirQualityData
SELECT * FROM SoilQualityData
SELECT * FROM WaterQualityData
SELECT * FROM NoiseLevelData
SELECT * FROM PollutantData
SELECT * FROM Pollutants
SELECT * FROM Alert

--INSERT DATA INTO TABLES

INSERT INTO Locations VALUES (01,40.7128, -74.0060,'North America', 'USA', 'New York'),
(02, 34.0522, -118.2437, 'North America','USA', 'Los Angeles'),
(03, 51.5074, -0.1278,'Europe', 'UK', 'London'),
(04, 48.8566,2.3522, 'Europe', 'France', 'Paris'),
(05, 35.6895, 139.6917,'Asia', 'Japan', 'Tokyo'),
(06, -33.8688, 151.2093, 'Oceania', 'Australia', 'Sydney'),
(07, -23.5505, -46.6333, 'South America', 'Brazil', 'Sao Paulo'),
(08, 55.7558, 37.6176, 'Europe', 'Russia', 'Moscow'),
(09, 19.0760, 72.8777, 'Asia', 'Pakistan', 'Lahore'),
(010, 37.7749, -122.4194, 'North America', 'USA', 'San Francisco'),
(011, 35.6895, 51.3890, 'Asia', 'Iran', 'Tehran'),
(012, 41.9028, 12.4964, 'Europe', 'Italy', 'Rome'),
(013, -1.2864, 36.8172, 'Africa', 'Kenya', 'Nairobi'),
(014, -25.7461, 28.1881, 'Africa', 'South Africa', 'Pretoria'),
(015, -33.9249, 18.4241, 'Africa', 'South Africa', 'Cape Town'),
(016, 48.1351, 11.5820, 'Europe', 'Germany', 'Munich'),
(017, 55.7558, 12.4376, 'Europe', 'Denmark', 'Copenhagen'),
(018, 52.2297, 21.0122, 'Europe', 'Poland', 'Warsaw'),
(019, 52.5200, 13.4050, 'Europe', 'Germany', 'Berlin'),
(020, 38.7223, -9.1393, 'Europe', 'Portugal', 'Lisbon')

INSERT INTO Sensors VALUES (01,01,'2023-01-01',0,0),
(02,02,'2024-02-15',0,0),
(03,020,'2023-12-10', 0,0),
(04,014,'2022-11-20',0,0),
(05,013,'2024-03-05',0,0),
(06,016,'2024-04-17',0,0),
(07,08,'2021-05-25',0,0),
(08,03,'2023-06-01',0,0),
(09,06,'2022-06-05',0,0),
(010,010,'2024-02-10',0,0),
(011,017,'2023-10-01',0,0),
(012,019,'2021-06-18',0,0),
(013,04,'2023-12-20',0,0),
(014,07,'2024-05-05',0,0),
(015,012,'2024-03-13',0,0),
(016,020,'2023-05-23',0,0),
(017,018,'2022-09-08',0,0),
(018,010,'2023-12-10',0,0),
(019,015,'2021-06-10',0,0),
(020,02,'2024-04-25',0,0);

INSERT INTO Readings VALUES (01,011,'08:30:00','2023-06-01'),
(02,01,'09:45:00','2024-06-01'),
(03,03,'10:15:00','2024-01-02'),
(04,06,'11:00:00','2023-06-02'),
(05,07,'12:30:00','2024-06-03'),
(06,05,'13:45:00','2024-06-03'),
(07,09,'14:00:00','2023-05-20'),
(08,014,'15:15:00','2023-10-04'),
(09,015,'16:30:00','2022-07-05'),
(010,010,'17:45:00','2024-03-23'),
(011,013,'08:00:00','2024-01-07'),
(012,012,'09:30:00','2021-11-26'),
(013,02,'10:45:00','2024-02-07'),
(014,04,'11:15:00','2024-06-01'),
(015,08,'12:00:00','2024-04-08'),
(016,017,'13:30:00','2023-07-11'),
(017,019,'14:45:00','2022-12-09'),
(018,020,'15:15:00','2024-05-29'),
(019,016,'16:00:00','2022-06-10'),
(020,04,'17:30:00','2024-04-29')

INSERT INTO AirQualityData VALUES (01,25.3,60.2,5.5,180),
(2,22.1,55.4,3.8,270),
(3,18.0,65.0,4.2,90),
(4,19.5,70.1,6.0,120),
(5,28.4,50.5,7.1,200),
(6,21.0,80.0,5.0,150),
(7,26.7,75.3,2.9,300),
(8,17.2,60.8,4.5,250),
(9, 30.5,45.2,3.1,140),
(10,20.0,68.4,6.5,190),
(11,35.0,30.1,4.0,110),
(12,22.5,65.0,5.9,80),
(13,27.0,50.0,3.7,210),
(14,23.8,70.2,4.6,170),
(15,20.2,60.0,5.4,220),
(16,19.1,55.0,4.8, 240),
(17,17.0,65.3,3.5,260),
(18,16.8,60.1, 5.2,180),
(19,15.5,70.4,4.9,100),
(20,24.3,58.2,3.6,290);

INSERT INTO SoilQualityData VALUES (01, 23.5, 7.2, 4.5, 0.8, 65.0),
(02, 18.3, 6.8, 3.9, 0.5, 70.2),
(03, 25.1, 7.5, 4.8, 0.9, 62.3),
(04, 22.7, 7.0, 4.2, 0.7, 68.1),
(05, 20.2, 6.5, 3.7, 0.6, 69.5),
(06, 26.3, 7.8, 5.0, 1.0, 61.0),
(07, 24.5, 7.3, 4.6, 0.8, 66.8),
(08, 19.6, 6.7, 3.8, 0.5, 71.4),
(09, 21.7, 6.9, 4.0, 0.6, 67.2),
(010, 27.1, 7.9, 5.1, 1.1, 60.5),
(011, 22.0, 6.8, 4.1, 0.7, 69.0),
(012, 20.8, 6.6, 3.9, 0.6, 70.0),
(013, 23.9, 7.2, 4.5, 0.8, 65.5),
(014, 19.8, 6.7, 3.8, 0.5, 71.0),
(015, 26.5, 7.8, 5.0, 1.0, 61.8),
(016, 21.9, 7.0, 4.2, 0.7, 68.0),
(017, 25.3, 7.4, 4.7, 0.9, 63.2),
(018, 22.4, 6.9, 4.1, 0.7, 68.5),
(019, 20.5, 6.6, 3.9, 0.6, 70.5),
(020, 24.2, 7.3, 4.6, 0.8, 66.0);

INSERT INTO WaterQualityData VALUES (01, 7.4, 8.2, 3.5, 150.0, 500.0),
(02, 6.8, 7.6, 4.0, 180.0, 540.0),
(03, 7.2, 8.0, 3.0, 160.0, 520.0),
(04, 7.6, 8.4, 3.2, 170.0, 530.0),
(05, 6.9, 7.5, 4.1, 175.0, 550.0),
(06, 7.1, 8.1, 3.3, 165.0, 510.0),
(07, 7.3, 8.3, 3.6, 155.0, 505.0),
(08, 7.0, 7.8, 3.9, 160.0, 515.0),
(09, 6.7, 7.4, 4.2, 180.0, 540.0),
(010, 7.5, 8.5, 3.1, 150.0, 500.0),
(011, 7.8, 8.6, 3.4, 160.0, 510.0),
(012, 7.0, 7.7, 3.8, 170.0, 520.0),
(013, 6.9, 7.3, 4.3, 180.0, 530.0),
(014, 7.2, 8.0, 3.5, 160.0, 500.0),
(015, 7.6, 8.2, 3.6, 155.0, 505.0),
(016, 7.1, 7.9, 3.9, 165.0, 515.0),
(017, 7.4, 8.1, 3.2, 175.0, 525.0),
(018, 7.3, 8.3, 3.7, 160.0, 510.0),
(019, 6.8, 7.5, 4.1, 150.0, 500.0),
(020, 7.5, 8.4, 3.3, 155.0, 505.0);

INSERT INTO NoiseLevelData VALUES (01, 55, 500.5),
(02, 65, 600.2),
(03, 45, 450.0),
(04, 70, 700.1),
(05, 60, 550.3),
(06, 75, 750.7),
(07, 50, 480.4),
(08, 68, 680.2),
(09, 58, 520.0),
(010, 72, 720.8),
(011, 62, 580.1),
(012, 77, 770.5),
(013, 52, 490.6),
(014, 67, 660.9),
(015, 54, 510.7),
(016, 69, 690.3),
(017, 63, 600.8),
(018, 74, 740.1),
(019, 59, 530.2),
(020, 71, 710.4);

INSERT INTO Pollutants VALUES (01, 'CO', 'Carbon Monoxide', 'ppm', 9.0),
(02, 'NO2', 'Nitrogen Dioxide', 'ppb', 53.0),
(03, 'SO2', 'Sulfur Dioxide', 'ppb', 75.0),
(04, 'O3', 'Ozone', 'ppb', 70.0),
(05, 'PM2.5', 'Particulate Matter <2.5µm', 'µg/m³', 35.0),
(06, 'PM10', 'Particulate Matter <10µm', 'µg/m³', 150.0),
(07, 'Pb', 'Lead', 'µg/m³', 0.15),
(08, 'NH3', 'Ammonia', 'ppm', 0.5),
(09, 'CH4', 'Methane', 'ppm', 5.0),
(010, 'CO2', 'Carbon Dioxide', 'ppm', 1000.0),
(011, 'C6H6', 'Benzene', 'ppb', 5.0),
(012, 'As', 'Arsenic', 'µg/m³', 0.01),
(013, 'Cd', 'Cadmium', 'µg/m³', 0.005),
(014, 'BaP', 'Benzo(a)pyrene', 'ng/m³', 1.0),
(015, 'Hg', 'Mercury', 'ng/m³', 200.0),
(016, 'Ni', 'Nickel', 'µg/m³', 0.02),
(017, 'Cr', 'Chromium', 'µg/m³', 0.1),
(018, 'H2S', 'Hydrogen Sulfide', 'ppb', 0.1),
(019, 'VOCs', 'Volatile Organic Compounds', 'ppb', 500.0),
(020, 'Radon', 'Radon', 'pCi/L', 4.0);

INSERT INTO PollutantData VALUES (01, 03, 06, 175.0)
INSERT INTO PollutantData VALUES(02, 06, 015,140.0)
INSERT INTO PollutantData VALUES(03, 011, 09, 4.0)
INSERT INTO PollutantData VALUES(04, 05, 012, 0.03)
INSERT INTO PollutantData VALUES(05, 05, 04, 85.0)
INSERT INTO PollutantData VALUES(06, 07, 016, 0.01)
INSERT INTO PollutantData VALUES(07, 016, 07, 0.12)
INSERT INTO PollutantData VALUES(08, 019, 08, 0.7)
INSERT INTO PollutantData VALUES(09, 08, 015, 120.0)
INSERT INTO PollutantData VALUES(010, 015, 011, 4.0)
INSERT INTO PollutantData VALUES(011, 013, 01, 7.0)
INSERT INTO PollutantData VALUES(012, 04, 04, 67.0)
INSERT INTO PollutantData VALUES(013, 017, 013, 0.004)
INSERT INTO PollutantData VALUES(014, 02, 017, 1.0)
INSERT INTO PollutantData VALUES(015, 018, 015, 180.0)
INSERT INTO PollutantData VALUES(016, 03, 02, 45.0)
INSERT INTO PollutantData VALUES(017, 012, 020, 5.0)
INSERT INTO PollutantData VALUES(018, 014, 014, 0.09)
INSERT INTO PollutantData VALUES(019, 020, 03, 60.0)
INSERT INTO PollutantData VALUES(020, 020, 010, 1010.0)

--PROCRDURES

CREATE PROCEDURE AlertInsert
@NPollutantDataID INT,
@NReason VARCHAR(20),
@NValue FLOAT
AS
BEGIN
SET NOCOUNT ON;
Insert into Alert(PollutantDataID,Reason,Value)
values(@NPollutantDataID,@NReason,@NValue)
END
GO

--Procedures

CREATE PROCEDURE AddPollutant
@NPollutantID INT,
@NName VARCHAR(20),
@NDescription VARCHAR(50),
@NMeasurementUnit VARCHAR(20),
@NSafetyThreshold FLOAT
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO Pollutants(PollutantID,Name,Description,MeasurementUnit,SafetyThreshold)
VALUES(@NPollutantID,@NName,@NDescription,@NMeasurementUnit,@NSafetyThreshold)
END
GO

CREATE PROCEDURE ReadingsByDate
@NStartDate date,
@NEndDate date
AS
BEGIN
SET NOCOUNT ON;
SELECT * FROM Readings
WHERE date BETWEEN @NStartDate AND @NEndDate 
END
GO

--TRIGGERS

CREATE TRIGGER AddAlert
ON PollutantData
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @NPollutantDataID INT;
DECLARE @NReason VARCHAR(20);
DECLARE @NValue FLOAT;

SELECT @NPollutantDataID = i.PollutantDataID, @NValue = i.Value FROM inserted i;

SELECT @NReason = Pollutants.Name
FROM Pollutants inner join PollutantData on Pollutants.PollutantID = PollutantData.PollutantID
where PollutantDataID=@NPollutantDataID;

IF @Nvalue > (SELECT SafetyThreshold FROM Pollutants inner join PollutantData on Pollutants.PollutantID = PollutantData.PollutantID where PollutantDataID=@NPollutantDataID)
BEGIN
EXEC AlertInsert @NPollutantDataID, @NReason, @NValue;
END
END;

CREATE TRIGGER AddStatus
ON Sensors
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
UPDATE Sensors
SET status = 'Inactive'
FROM Sensors s inner join inserted i ON s.SensorID = i.SensorID
WHERE DATEDIFF(MONTH, i.InstallationDate, GETDATE()) > 6;

UPDATE Sensors
SET status = 'Active'
FROM Sensors s inner join inserted i ON s.SensorID = i.SensorID
WHERE DATEDIFF(MONTH, i.InstallationDate, GETDATE()) <= 6;
END;

CREATE TRIGGER LastUpdated
ON Sensors
AFTER UPDATE
AS 
BEGIN 
SET NOCOUNT ON;

UPDATE Sensors
SET LastUpdated = GETDATE()
FROM Sensors s inner join inserted i ON s.SensorID = i.SensorID
END;

--VIEWS

CREATE VIEW [ActiveSensors]
AS SELECT * FROM SENSORS
WHERE status = 'Active'

CREATE VIEW [CityWithMostNoiseLevel]
AS SELECT TOP 1 l.City, max(n.NoiseLevel) as MaxNoise
FROM locations l inner join Sensors  s on l.LocationID=s.LocationID inner join Readings r on s.SensorID=r.SensorID inner join NoiseLevelData n on r.ReadingID=n.ReadingID
group by l.City
order by MaxNoise DESC

CREATE VIEW [AverageSoilQualityByRegion]
AS SELECT Region, avg(SoilMoisture) as AverageSoilMoisture, avg(NutrientLevels) as AverageNutrientLevels, avg(OrganicMatter) as AverageOrganicMatter, avg(Salinity) as AverageSalinity, avg(BaseSaturation) as AverageBaseSaturation
FROM locations l inner join Sensors s on l.LocationID=s.LocationID inner join Readings r on s.SensorID=r.SensorID inner join SoilQualityData soil on r.ReadingID=soil.ReadingID  
group by Region

CREATE VIEW [TotalSensorsByCountry]
AS SELECT Country,count(SensorID) as TotalSensors
From Locations l inner join Sensors s on l.LocationID=s.LocationID
group by country

select * from [ActiveSensors]
select * from [CityWithMostNoiseLevel]
select * from [AverageSoilQualityByRegion]
select * from [TotalSensorsByCountry]