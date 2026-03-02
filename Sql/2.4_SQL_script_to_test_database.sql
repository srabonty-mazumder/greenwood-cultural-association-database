USE EventManagementDB;
GO

SELECT * FROM Buyer;

SELECT * FROM Artist;

SELECT * FROM Venue;

SELECT * FROM Event;

SELECT * FROM Booking;


--1 Booking tickets

INSERT INTO Booking (BuyerID, EventID, BookingDate, BookingStatus, NumberOfTicket)
VALUES (1, 3, SYSDATETIME(), 'reserved', 2);


--2 Changing the number of tickets in a booking 

UPDATE Booking
SET NumberOfTicket = 5
WHERE BookingID = 1;

--3 Changing ticket booking status to 'sold' when tickets are purchased

UPDATE Booking
SET BookingStatus = 'sold'
WHERE BookingID = 1;

--4 Cancelling a ticket booking 

UPDATE Booking
SET BookingStatus = 'cancelled'
WHERE BookingID = 3;


--5 Removing unpurchased bookings from the database after three days from booking

DELETE FROM Booking
WHERE BookingStatus <> 'sold'
  AND BookingDate < DATEADD(DAY, -3, SYSDATETIME());

--6 Cancelling the status of an event to 'cancelled' if the event is cancelled

UPDATE Event
SET EventStatus = 'cancelled'
WHERE EventID = 5;

--7 Refunding a client in a case of a cancelled event

UPDATE Booking
SET BookingStatus = 'refunded'
WHERE EventID = 5
  AND BookingStatus = 'sold';

-----------------------------------------------------
-----------------------------------------------------


--1 What is Taylor Swift's contact email?
SELECT ArtistContactEmail
FROM Artist
WHERE FirstName = 'Taylor'
  AND LastName = 'Swift';

--2 Which artists are scheduled to perform in the Jazz Night event on 30.11.2025?

SELECT A.FirstName, A.LastName
FROM Event E
JOIN Event_Artist EA ON E.EventID = EA.EventID
JOIN Artist A ON EA.ArtistID = A.ArtistID
WHERE E.EventType = 'Jazz Night'
  AND E.EventDate = '2025-11-30';

--3 What is the venue name and address for Billie Eilish's concert on 25.3.2026?

SELECT V.VenueName, V.VenueAddress
FROM Event E
JOIN Event_Artist EA ON E.EventID = EA.EventID
JOIN Artist A ON EA.ArtistID = A.ArtistID
JOIN Venue V ON E.VenueID = V.VenueID
WHERE A.FirstName = 'Billie'
  AND A.LastName = 'Eilish'
  AND E.EventDate = '2026-03-25';

--4 When is Imagine Dragons' performance in Greenwood, and what are their special requests for catering?

SELECT E.EventDate, A.Request
FROM Event E
JOIN Event_Artist EA ON E.EventID = EA.EventID
JOIN Artist A ON EA.ArtistID = A.ArtistID
JOIN Venue V ON E.VenueID = V.VenueID
WHERE A.FirstName = 'Imagine'
  AND A.LastName = 'Dragons'
  AND V.VenueName LIKE '%Greenwood%'

--5 What events are coming up this year?

SELECT EventID, EventType, EventDate
FROM Event
WHERE YEAR(EventDate) = YEAR(GETDATE())
  AND EventStatus = 'scheduled';

--6 What dance performances are coming up this year?

SELECT EventID, EventType, EventDate
FROM Event
WHERE EventType LIKE '%Dance%'
  AND YEAR(EventDate) = YEAR(GETDATE())
  AND EventStatus = 'scheduled'

--7 How many tickets have been sold so far for The Weeknd's concert scheduled for 5.2.2026?

SELECT SUM(B.NumberOfTicket) AS TicketsSold
FROM Booking B
JOIN Event E ON B.EventID = E.EventID
JOIN Event_Artist EA ON E.EventID = EA.EventID
JOIN Artist A ON EA.ArtistID = A.ArtistID
WHERE A.FirstName = 'The'
  AND A.LastName = 'Weeknd'
  AND E.EventDate = '2026-02-05'
  AND B.BookingStatus = 'sold';

--8 How many tickets remain for Harry Styles' concert on 12.9.2025?

SELECT 
    V.Capacity - ISNULL(SUM(B.NumberOfTicket), 0) AS TicketsRemaining
FROM Event E
JOIN Venue V ON E.VenueID = V.VenueID
LEFT JOIN Booking B ON E.EventID = B.EventID 
                    AND B.BookingStatus = 'sold'
WHERE E.EventID = 5   -- ensures proper match
GROUP BY V.Capacity;

--9 How much revenue has the Greenwood Association generated from ticket sales this year?

SELECT 
    SUM(B.NumberOfTicket * 50) AS Revenue
FROM Booking B
JOIN Event E ON B.EventID = E.EventID
JOIN Venue V ON E.VenueID = V.VenueID
WHERE YEAR(E.EventDate) = YEAR(GETDATE())
  AND V.VenueName LIKE '%Greenwood%'
  AND B.BookingStatus = 'sold';

  