-- Database Indexes (database_index.sql)

-- Indexes for User Table
CREATE INDEX idx_user_email ON "User" (email);
CREATE INDEX idx_user_user_id ON "User" (user_id);
CREATE INDEX idx_user_created_at ON "User" (created_at);

-- Indexes for Booking Table
CREATE INDEX idx_booking_booking_id ON Booking (booking_id);
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_status ON Booking (status);
CREATE INDEX idx_booking_created_at ON Booking (created_at);

-- Indexes for Property Table
CREATE INDEX idx_property_property_id ON Property (property_id);
CREATE INDEX idx_property_owner_id ON Property (owner_id);
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_created_at ON Property (created_at);

-- Measuring Query Performance (Before and After Indexing)
-- Before Adding Indexes
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE user_id = 123 AND status = 'confirmed';

-- After Adding Indexes
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE user_id = 123 AND status = 'confirmed';
