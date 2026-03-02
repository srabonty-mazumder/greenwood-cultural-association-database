USE EventManagementDB;
GO

-- 1. INSERT VENUES

INSERT INTO Venue (VenueName, VenueAddress, Capacity)
VALUES
('Greenwood Arena', '100 Greenwood Avenue, Dublin', 15000),
('City Concert Hall', '45 Grand Street, Dublin', 9000),
('River Park Amphitheatre', '12 Riverside Road, Cork', 20000),
('Downtown Jazz Club', '88 Main Street, Limerick', 2000),
('National Dance Theatre', '12 Academy Avenue, Galway', 5000);

-- 2. INSERT ARTISTS

INSERT INTO Artist (FirstName, LastName, ArtistContactEmail, Request)
VALUES
('Taylor', 'Swift', 'taylor@swiftmusic.com', 'Gluten-free catering and quiet dressing room.'),
('Billie', 'Eilish', 'billie@eilishworld.com', 'Vegan meals only.'),
('Imagine', 'Dragons', 'contact@imaginedragons.com', 'Extra lighting and fruit baskets.'),
('The', 'Weeknd', 'tour@theweeknd.com', 'High-protein meals and security escort.'),
('Harry', 'Styles', 'harry@stylesmusic.com', 'Hot herbal tea and warm-up room.'),
('Jazz', 'Ensemble', 'jazzensemble@music.ie', 'Piano tuning required.'),
('Elite', 'DanceCrew', 'dancecrew@elite.ie', 'Sprung dance floor and bottled water.');


-- 3. INSERT EVENTS

INSERT INTO Event (EventDate, EventType, VenueID, EventStatus)
VALUES
('2025-11-30', 'Jazz Night', 4, 'scheduled'),          -- EventID 1
('2026-03-25', 'Pop Concert', 2, 'scheduled'),         -- EventID 2
('2026-05-10', 'Rock Concert', 1, 'scheduled'),        -- EventID 3
('2026-02-05', 'Pop Concert', 1, 'scheduled'),         -- EventID 4
('2025-09-12', 'Pop Concert', 3, 'scheduled'),         -- EventID 5
('2025-08-20', 'Dance Performance', 5, 'scheduled');   -- EventID 6 ← Required for “dance performances”


-- 4. INSERT EVENT–ARTIST RELATIONSHIPS

INSERT INTO Event_Artist (EventID, ArtistID)
VALUES
(1, 6),  -- Jazz Night ← Jazz Ensemble
(2, 2),  -- Billie Eilish
(3, 3),  -- Imagine Dragons
(4, 4),  -- The Weeknd
(5, 5),  -- Harry Styles
(6, 7);  -- Dance Performance ← Elite DanceCrew


-- 5. INSERT BUYERS

INSERT INTO Buyer (PhoneNumber)
VALUES
('0891112222'),
('0893334444'),
('0895556666'),
('0897778888');


-- 6. INSERT BOOKINGS

-- BuyerID, EventID, BookingDate, BookingStatus, NumberOfTicket

INSERT INTO Booking (BuyerID, EventID, BookingDate, BookingStatus, NumberOfTicket)
VALUES
(1, 4, '2026-01-01', 'reserved', 3),      -- Weeknd, reserved
(2, 5, '2025-07-01', 'sold', 2),          -- Harry Styles, sold
(3, 3, '2026-02-15', 'reserved', 4),      -- Imagine Dragons, reserved
(2, 4, '2026-01-15', 'sold', 5),          -- Weeknd, sold
(4, 6, '2025-08-10', 'sold', 6),          -- Dance Performance, sold
(1, 1, '2025-11-10', 'reserved', 2);      -- Jazz Night, reserved
