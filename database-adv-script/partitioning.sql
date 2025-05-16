-- Step 1: Create a Partitioned Booking Table (if not already partitioned)
CREATE TABLE Booking_partitioned (
    booking_id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
    property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create Yearly Partitions for the Booking Table
CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Transfer Data from the Original Booking Table to the Partitioned Table
INSERT INTO Booking_partitioned (booking_id, user_id, property_id, start_date, end_date, status, created_at)
SELECT booking_id, user_id, property_id, start_date, end_date, status, created_at 
FROM Booking;

-- Step 4: Indexing Partitions for Faster Query Performance
CREATE INDEX idx_booking_part_user_id ON Booking_partitioned (user_id);
CREATE INDEX idx_booking_part_property_id ON Booking_partitioned (property_id);
CREATE INDEX idx_booking_part_start_date ON Booking_partitioned (start_date);

-- Testing Query Performance on Partitioned Table
EXPLAIN ANALYZE 
SELECT * 
FROM Booking_partitioned 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Testing Query Performance on Non-Partitioned Original Table
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
