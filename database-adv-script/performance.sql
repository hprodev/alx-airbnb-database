-- Initial Query: Retrieving all bookings with user, property, and payment details
SELECT 
    Booking.booking_id,
    Booking.booking_date,
    Booking.status,
    "User".user_id,
    "User".name AS user_name,
    "User".email AS user_email,
    Property.property_id,
    Property.title AS property_title,
    Property.location AS property_location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date
FROM 
    Booking
JOIN 
    "User" ON Booking.user_id = "User".user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;

-- Optimized Query with indexing and filtering
SELECT 
    Booking.booking_id,
    Booking.booking_date,
    Booking.status,
    "User".user_id,
    "User".name AS user_name,
    "User".email AS user_email,
    Property.property_id,
    Property.title AS property_title,
    Property.location AS property_location,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_date
FROM 
    Booking
JOIN 
    "User" ON Booking.user_id = "User".user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
JOIN 
    Payment ON Booking.booking_id = Payment.booking_id
WHERE 
    Booking.status = 'confirmed' -- Filtered to confirmed bookings
ORDER BY 
    Booking.booking_date DESC; -- Sorted to prioritize recent bookings

-- Indexes for optimized performance
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_status ON Booking (status);
CREATE INDEX idx_user_user_id ON "User" (user_id);
CREATE INDEX idx_property_property_id ON Property (property_id);
CREATE INDEX idx_payment_booking_id ON Payment (booking_id);
CREATE INDEX idx_booking_status_start_date ON Booking (status, start_date);
