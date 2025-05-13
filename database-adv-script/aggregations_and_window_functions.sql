-- Find the total number of bookings made by each user
SELECT 
    user_id,
    COUNT(booking_id) AS total_bookings
FROM 
    Booking
GROUP BY 
    user_id
ORDER BY 
    total_bookings DESC;

-- Rank properties based on the total number of bookings they have received
SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER
                (ORDER BY COUNT(booking_id) DESC) AS rank
FROM 
    Booking
GROUP BY 
    property_id;