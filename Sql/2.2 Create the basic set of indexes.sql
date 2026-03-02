USE EventManagementDB;
GO
-- INDEX 1: Event → Venue (foreign key)

CREATE NONCLUSTERED INDEX IX_Event_VenueID
ON Event (VenueID);
GO
-- INDEX 2: Booking → Buyer (foreign key)

CREATE NONCLUSTERED INDEX IX_Booking_BuyerID
ON Booking (BuyerID);
GO
-- INDEX 3: Booking → Event (foreign key)

CREATE NONCLUSTERED INDEX IX_Booking_EventID
ON Booking (EventID);
GO
-- INDEX 4: Event_Artist → Artist (foreign key)

CREATE NONCLUSTERED INDEX IX_EventArtist_ArtistID
ON Event_Artist (ArtistID);
GO
-- INDEX 5: EventDate (search/filter queries)

CREATE NONCLUSTERED INDEX IX_Event_EventDate
ON Event (EventDate);
GO
