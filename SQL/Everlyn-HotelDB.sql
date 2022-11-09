/*
Creator: Everlyn Leon

Part 2: Define the Database
Using your ERD as an example, create a SQL script that performs the following steps:

Create a new database named YourNameHotelDB.
Drops the existing database, if it exists, so that the script can rebuild a database with the same name.
Creates the tables with all appropriate fields, data types, and keys, using the structure indicated in the ERD.
Tip: Create the primary tables first, followed by the tables with foreign keys.

*/

DROP DATABASE IF EXISTS HotelReservation;
CREATE DATABASE IF NOT EXISTS HotelReservation;
USE HotelReservation;

CREATE TABLE RoomType (
	RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Type CHAR(10) NOT NULL,   
	StandardOccupancy INT NOT NULL,
	MaximumOccupancy INT NOT NULL,
    BasePrice DECIMAL(5, 2) NOT NULL,
    ExtraPersonPrice DECIMAL(4, 2) NULL
);

CREATE TABLE Rooms (
	RoomNumber INT PRIMARY KEY,
    ADAAccessible BOOL NOT NULL,
    RoomTypeID INT NOT NULL,
    FOREIGN KEY fk_Room_RoomType (RoomTypeID)
		REFERENCES RoomType(RoomTypeID)    
);

CREATE TABLE Amenities (
	AmenityID INT PRIMARY KEY AUTO_INCREMENT,
	Name CHAR(50) NOT NULL
);

CREATE TABLE RoomAmenity (
    RoomNumber INT NOT NULL,
	AmenityID INT NOT NULL,
    PRIMARY KEY pk_RoomAmenity (RoomNumber, AmenityID),
	FOREIGN KEY fk_ARoomAmenity_Room (RoomNumber)
		REFERENCES Rooms(RoomNumber),
    FOREIGN KEY fk_RoomAmenity_Amenity (AmenityID)
		REFERENCES Amenities(AmenityID)
);

CREATE TABLE Guest (
	GuestID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    City CHAR(25),
    State CHAR(2),
    Zip CHAR(10),
    Phone CHAR(20)
);

CREATE TABLE Reservations (
	ReservationID INT PRIMARY KEY,
    RoomNumber INT NOT NULL,
    FOREIGN KEY fk_Reservation_Room (RoomNumber)
		REFERENCES Rooms(RoomNumber),    
    GuestID INT NOT NULL,
    FOREIGN KEY fk_Reservation_Guest (GuestID)
		REFERENCES Guest(GuestID),
	StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Adult INT NOT NULL,
    Children INT NOT NULL,
    TotalRoomCost DECIMAL(20, 2)
);