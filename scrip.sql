-- 1- Create a new database named AutomotiveDB.
CREATE DATABASE IF NOT EXISTS AutomotiveDB;

-- 2- Create the Cars table with the following columns
USE AutomotiveDB;

Create table Cars (
								CarID INT Primary key AUTO_INCREMENT,
                                CarModel VARCHAR(100) NOT NULL,
                                Year INT NOT NULL,
                                Price DECIMAL(10,2) NOT NULL,
                                Color  ENUM('Red', 'Blue', 'Green', 'Black', 'White') Not Null

  );
  
  -- 3-Create the Owners table with the following columns

create table  Owners(
OwnerID INT Primary key Auto_Increment,
OwnerName VARCHAR(100) Not Null,
OwnerAddress VARCHAR(255) Not Null,
OwnerPhone VARCHAR(20) Not Null

);

-- 3- Create the Services table with the following columns
 create table  Services(
ServiceID INT Primary key Auto_Increment,
ServiceName VARCHAR(100) Not Null,
ServiceDescription TEXT,
ServiceCost DECIMAL(10, 2) Not Null

);

-- Ticket 2: Create Relationships and Constraints
Create table Ownerships(
		OwnershipID INT  Primary key auto_increment,
		CarID INT ,
		OwnerID INT, 
		PurchaseDate DATE Not Null,
         Foreign key (CarID) REFERENCES Cars(CarID)  ON DELETE CASCADE ON UPDATE CASCADE, 
         Foreign key (OwnerID)  REFERENCES Owners(OwnerID)  ON DELETE CASCADE ON UPDATE CASCADE

);

-- 2- Create the CarServices table with the following columns
create table CarServices(
		CarID INT ,
        ServiceID INT,
        ServiceDate DATE Not Null,
		Primary key (CarID, ServiceID),
        Foreign key (CarID) REFERENCES Cars(CarID)  ON DELETE CASCADE ON UPDATE CASCADE,
        Foreign key (ServiceID) REFERENCES Services(ServiceID)  ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3- Create the Mechanics table with the following columns:
create table Mechanics(
		MechanicID INT  Primary key auto_increment,
		MechanicName  VARCHAR(100)  Not Null,
		PhoneNumber  VARCHAR(20)  Not Null,
		HireDate TIMESTAMP Default CURRENT_TIMESTAMP
);

-- 4- Create the Garages table with the following columns:
create table Garages(
		GarageID  INT Primary key Auto_Increment,
		GarageName VARCHAR(100) Not Null Unique,
		Location VARCHAR(255) Not Null

);

-- 5- Create the CarMechanics table with the following columns:
create table CarMechanics(
		CarID INT  ,
		MechanicID INT ,
		ServiceDate DATE Not Null,
		Primary key  (CarID,MechanicID)  ,
        Foreign key  (CarID) REFERENCEs Cars(CarID) ON DELETE CASCADE ON UPDATE CASCADE,
        Foreign key (MechanicID) REFERENCES  Mechanics(MechanicID) ON DELETE CASCADE ON UPDATE CASCADE

);



--   														Ticket 3: Insert Sample Data
INSERT INTO Cars (CarModel, Year, Price, Color) VALUES
('Toyota Camry', 2020, 25000.00, 'Red'),
('Honda Accord', 2021, 27000.00, 'Blue'),
('Ford Focus', 2019, 22000.00, 'Green');

INSERT INTO Owners (OwnerName, OwnerAddress, OwnerPhone) VALUES
('John Doe', '123 Elm St', '555-1234'),
('Alice Johnson', '456 Oak St', '555-8765');

INSERT INTO Services (ServiceName, ServiceDescription, ServiceCost) VALUES
('Oil Change', 'Change the engine oil', 50.00),
('Tire Rotation', 'Rotate the tires', 30.00);

INSERT INTO Ownerships (CarID, OwnerID, PurchaseDate) VALUES
(1, 1, '2020-05-10'),
(2, 2, '2021-08-15');

INSERT INTO CarServices (CarID, ServiceID, ServiceDate) VALUES
(1, 1, '2021-01-10'),
(1, 2, '2021-06-15'),
(2, 1, '2021-02-20');

INSERT INTO Mechanics (MechanicName, PhoneNumber) VALUES
('Mike Smith', '555-6789'),
('Sarah Brown', '555-9876');

INSERT INTO Garages (GarageName, Location) VALUES
('Downtown Garage', '789 Maple St'),
('Uptown Garage', '101 Oak St');

INSERT INTO CarMechanics (CarID, MechanicID, ServiceDate) VALUES
(1, 1, '2021-01-10'),
(2, 2, '2021-08-15');


-- 												Ticket 4: Test Cascading Behavior

Select * from Cars;
Select * from  Services;
Select * from  Owners;
Select * from Ownerships;
Select * from CarServices;

--  1 Test cascading delete by deleting a car and checking related tables.
DELETE FROM Cars WHERE CarID = 1;

-- 2- Test cascading update by updating a car ID and checking related tables. 

UPDATE Cars SET CarID = 100 WHERE CarID = 2;

INSERT INTO Cars (CarModel, Year, Price, Color) VALUES
('RANGE ROVER', 2024, 25000.00, 'BLACK');

-- 3- Test cascading delete by deleting an owner and checking related tables.
DELETE FROM Owners WHERE OwnerID = 2;

-- 4- Test cascading delete by deleting a service and checking related tables.

DELETE FROM Services WHERE ServiceID = 1;

-- 5 - Test cascading update by updating a service ID and checking related tables.

UPDATE Services SET ServiceID = 101 WHERE ServiceID = 1;




