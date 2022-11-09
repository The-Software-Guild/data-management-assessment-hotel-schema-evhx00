/*
Creator: Everlyn Leon

Part 3: Manage the Data
Create a separate SQL script to manage data in the tables.

First, using the data provided in the tables above, create the required SQL statements to populate the tables with the data above.

Include your name, address, and phone number in the first record of the table for guests. You may use a fictitious address and phone number, as long as you use your own name.
As with the tables, add data to the primary tables before adding data to the tables with foreign keys.
Second, after adding all of the data above, create SQL statements that will delete Jeremiah Pendergrass and his reservations from the database.

Deleting data should start with records that reference Jeremiah Pendergrass using a foreign key and then delete the record from the guest table as the last step.
The scripts should only delete records related to Jeremiah Pendergrass and his reservations. They should not delete any room data.


*/

USE HotelReservation;

INSERT INTO Amenities (AmenityID, `Name`) VALUES 
	(1, 'Microwave'),
    (2, 'Jacuzzi'),
    (3, 'Refrigerator'),
    (4, 'Oven'),
    (5, 'Jacuzzi');
    
INSERT INTO RoomType (RoomTypeID, Type, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPersonPrice) VALUES 
	(1, 'Single', 2, 2, 149.99, NULL),
    (2, 'Single', 2, 2, 174.99, NULL),
    (3, 'Double', 2, 4, 174.99, 10.00),
    (4, 'Double', 2, 4, 199.99, 10.00),
    (5, 'Suite', 3, 8, 399.99, 20.00);

INSERT INTO Rooms (RoomNumber, ADAAccessible, RoomTypeID) VALUES
	(201, FALSE, 4), (203, FALSE, 4),
    (205, FALSE, 2), (207, FALSE, 2),
    (301, FALSE, 4), (303, FALSE, 4),
    (305, FALSE, 2), (307, FALSE, 2),
	(202, TRUE, 3), (204, TRUE, 3),
    (206, TRUE, 1), (208, TRUE, 1),
    (302, TRUE, 3), (304, TRUE, 3),
    (306, TRUE, 1), (308, TRUE, 1),
	(401, TRUE, 5), (402, TRUE, 5);

INSERT INTO RoomAmenity (RoomNumber, AmenityID) VALUES 
	(201, 1), (201, 2), (203, 1), (203, 2), 
    (301, 1), (301, 2), (303, 1), (303, 2),
    (202, 3), (204, 3), (302, 3), (304, 3), 
    (206, 1), (206, 3), (208, 1), (208, 3), 
    (306, 1), (306, 3), (308, 1), (308, 3),
    (205, 1), (205, 2), (205, 3), (207, 1), 
    (207, 2), (207, 3), (305, 1), (305, 2), 
    (305, 3), (307, 1), (307, 2), (307, 3),
    (401, 1), (401, 3), (401, 4), (402, 1), 
    (402, 3), (402, 4);

INSERT INTO Guest (GuestID, FirstName, LastName, Address, City, State, Zip, Phone) VALUES
	(1, 'Everlyn', 'Leon', 'Mystery', 'Richmond', 'CA', '94444', '(510) 123-4567'),
    (2, 'Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
	(3, 'Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478) 277-9632'),
	(4, 'Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
	(5, 'Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214) 730-0298'),
	(6, 'Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
	(7, 'Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
	(8, 'Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
	(9, 'Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446) 396-6785'),
	(10, 'Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
	(11, 'Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
	(12, 'Joleen', 'Tison', '87 Queen St.', 'Drexel Hill',	'PA', '19026', '(231) 893-2755');
    
INSERT INTO Reservations (ReservationID, RoomNumber, GuestID, Adult, Children, StartDate, EndDate, TotalRoomCost) VALUES
	(1, 308, 2, 1, 0, '2023-02-02', '2023-02-04', 299.98),
	(2, 203, 3, 2, 1, '2023-02-05', '2023-02-10', 999.95),
	(3, 305, 4,	2, 0, '2023-02-22', '2023-02-24', 349.98),
	(4, 201, 5,	2, 2, '2023-03-06', '2023-03-07', 199.99),
	(5, 307, 1,	1, 1, '2023-03-17', '2023-03-20', 524.97),
	(6, 302, 6,	3, 0, '2023-03-18', '2023-03-23', 924.95),
	(7, 202, 7,	2, 2, '2023-03-29', '2023-03-31', 349.98),
	(8, 304, 8,	2, 0, '2023-03-31', '2023-04-05', 874.95),
	(9, 301, 9,	1, 0, '2023-04-09', '2023-04-13', 799.96),
	(10, 207, 10, 1, 1, '2023-04-23', '2023-04-24', 174.99),
	(11, 401, 11, 2, 4, '2023-05-30', '2023-06-02', 1199.97),
	(12, 206, 12, 2, 0, '2023-06-10', '2023-06-14', 599.96),
	(13, 208, 12, 1, 0, '2023-06-10', '2023-06-14', 599.96),
	(14, 304, 6, 3,	0,	'2023-06-17', '2023-06-18', 184.99),
	(15, 205, 1, 2, 0, '2023-06-28', '2023-07-02', 699.96),
	(16, 204, 9, 3, 1, '2023-07-13', '2023-07-14', 184.99),
	(17, 401, 10, 4, 2, '2023-07-18', '2023-07-21', 1259.97),
	(18, 303, 3, 2, 1, '2023-07-28', '2023-07-29', 199.99),
	(19, 305, 3, 1, 0, '2023-08-30', '2023-09-01', 349.98),
	(20, 208, 2, 2, 0, '2023-09-16', '2023-09-17', 149.99),
	(21, 203, 5, 2, 2, '2023-09-13', '2023-09-15', 399.98),
	(22, 401, 4, 2, 2, '2023-11-22', '2023-11-25', 1199.97),
	(23, 206, 2, 2, 0, '2023-11-22', '2023-11-25', 449.97),
	(24, 301, 2, 2, 2, '2023-11-22', '2023-11-25', 599.97),
	(25, 302, 11, 2, 0, '2023-12-24','2023-12-28', 699.96);
    
DELETE FROM Reservations
WHERE GuestID = 8;

DELETE FROM Guest
WHERE GuestID = 8;