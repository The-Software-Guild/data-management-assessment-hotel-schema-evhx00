/*
Creator: Everlyn Leon

Part 4: Query the Database
Create a third SQL script that includes queries to retrieve the following data from the database.

*/

USE HotelReservation;

/*
1: Write a query that returns a list of reservations that end in July 2023,
including the name of the guest, the room number(s), and the reservation dates.

'Everlyn Leon', '205', '2023-06-28', '2023-07-02'
'Walter Holaway', '204', '2023-07-13', '2023-07-14'
'Wilfred Vise', '401', '2023-07-18', '2023-07-21'
'Bettyann Seery', '303', '2023-07-28', '2023-07-29'

*/
SELECT * FROM Reservations;
SELECT CONCAT(FirstName, ' ', LastName) `Name`, 
RoomNumber Rooms, StartDate `From`, EndDate `To`
FROM  Reservations
INNER JOIN Guest ON Reservations.GuestID = Guest.GuestID
WHERE EndDate BETWEEN '2023-07-01' AND '2023-07-31';

/*
2: Write a query that returns all the rooms reserved for a specific guest,
including the guest's name, the room(s) reserved, the starting date of the reservation,
and how many people were included in the reservation. (Choose a guest's name from the existing data.)

'Karie Yang', '201', '2023-03-06', '2023-03-07'
'Bettyann Seery', '203', '2023-02-05', '2023-02-10'
'Karie Yang', '203', '2023-09-13', '2023-09-15'
'Everlyn Leon', '205', '2023-06-28', '2023-07-02'
'Wilfred Vise', '207', '2023-04-23', '2023-04-24'
'Walter Holaway', '301', '2023-04-09', '2023-04-13'
'Mack Simmer', '301', '2023-11-22', '2023-11-25'
'Bettyann Seery', '303', '2023-07-28', '2023-07-29'
'Duane Cullison', '305', '2023-02-22', '2023-02-24'
'Bettyann Seery', '305', '2023-08-30', '2023-09-01'
'Everlyn Leon', '307', '2023-03-17', '2023-03-20'

*/

SELECT CONCAT(FirstName, ' ', LastName) `Name`, 
Reservations.RoomNumber Rooms, StartDate `From`, EndDate `To`
FROM Reservations
JOIN Rooms ON Reservations.RoomNumber = Rooms.RoomNumber
JOIN RoomAmenity ON Rooms.RoomNumber = RoomAmenity.RoomNumber
JOIN Guest ON Reservations.GuestID = Guest.GuestID
WHERE AmenityID = 2;

/*
3: Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved,
 the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

'Everlyn Leon', '307', '2023-03-17', '2'
'Everlyn Leon', '205', '2023-06-28', '2'

*/
SELECT CONCAT(FirstName, ' ', LastName) `Name`, 
RoomNumber Rooms, StartDate `From`, (Adult + Children) NumberOfPeople
FROM Reservations
JOIN Guest ON Reservations.GuestID = Guest.GuestID
WHERE FirstName = 'Everlyn' AND LastName = 'Leon';

/*
3:  Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation.
The results should include all rooms, whether or not there is a reservation associated with the room.

'201', '4', '$199.99'
'202', '7', '$349.98'
'203', '2', '$999.95'
'203', '21', '$399.98'
'204', '16', '$184.99'
'205', '15', '$699.96'
'206', '12', '$599.96'
'206', '23', '$449.97'
'207', '10', '$174.99'
'208', '13', '$599.96'
'208', '20', '$149.99'
'301', '9', '$799.96'
'301', '24', '$599.97'
'302', '6', '$924.95'
'302', '25', '$699.96'
'303', '18', '$199.99'
'304', '14', '$184.99'
'305', '3', '$349.98'
'305', '19', '$349.98'
'306', NULL, NULL
'307', '5', '$524.97'
'308', '1', '$299.98'
'401', '11', '$1,199.97'
'401', '17', '$1,259.97'
'401', '22', '$1,199.97'
'402', NULL, NULL


*/
SELECT IFNULL(Reservations.RoomNumber, Rooms.RoomNumber) Rooms, ReservationID, CONCAT('$', FORMAT(TotalRoomCost, 2)) Cost
FROM Reservations
RIGHT JOIN Rooms ON Reservations.RoomNumber = Rooms.RoomNumber
JOIN RoomType ON Rooms.RoomTypeID = RoomType.RoomTypeID
ORDER BY Rooms.RoomNumber;

/*
4: Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.

N/A
*/
SELECT ReservationID, RoomNumber, (Adult + Children) NumberOfPeople, 
StartDate `From`, EndDate `To`
FROM Reservations
WHERE (Adult + Children) >= 3 AND EndDate BETWEEN '2023-04-01' AND '2023-04-30';

/*
5: Write a query that returns a list of all guest names and the number of reservations per guest,
sorted starting with the guest with the most reservations and then by the guest's last name.

'Mack Simmer', '4'
'Bettyann Seery', '3'
'Aurore Lipton', '2'
'Duane Cullison', '2'
'Everlyn Leon', '2'
'Joleen Tison', '2'
'Karie Yang', '2'
'Maritza Tilton', '2'
'Walter Holaway', '2'
'Wilfred Vise', '2'
'Zachery Luechtefeld', '1'

*/
SELECT CONCAT(FirstName, ' ', LastName) `Name`, 
COUNT(ReservationID) NumberOfReservations
FROM Reservations
JOIN Guest ON Reservations.GuestID = Guest.GuestID
GROUP BY CONCAT(FirstName, ' ', LastName)
ORDER BY COUNT(ReservationID) DESC, CONCAT(FirstName, ' ', LastName);

/*
6: Write a query that displays the name, address, and phone number of a guest based on their phone number. 
(Choose a phone number from the existing data.)

'Everlyn Leon', 'Mystery, Richmond, CA 94444', '(510) 123-4567'

*/
SELECT CONCAT(FirstName, ' ', LastName) `Name`, 
CONCAT(Address, ', ', City, ', ', State, ' ', Zip) Address, Phone
FROM Guest
WHERE Phone = '(510) 123-4567';