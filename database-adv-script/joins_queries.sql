-- Retrieve all bookings along with the first and last names of users who made them
SELECT 
    Booking.booking_id,
    "User".first_name,
    "User".last_name
FROM 
    Booking
INNER JOIN 
    "User" ON Booking.user_id = "User".user_id;

-- Retrieve all properties and their reviews (if any)
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Review.review_id,
    Review.rating,
    Review.comment
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id;

-- Retrieve all users and all bookings, even if no match exists
SELECT 
    "User".user_id,
    "User".first_name,
    "User".last_name,
    Booking.booking_id
FROM 
    "User"
FULL OUTER JOIN 
    Booking ON "User".user_id = Booking.user_id;