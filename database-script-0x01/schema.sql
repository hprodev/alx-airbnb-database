-- Airbnb Clone Database Schema
-- This script defines the database schema for the Airbnb Clone project.

-- Drop tables if they already exist (safety measure)
DROP TABLE IF EXISTS Message, Review, Payment, Booking, Property, User;

-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL DEFAULT 'guest',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE Property
(
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON
    UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY
    (host_id) REFERENCES User
    (user_id) ON
    DELETE CASCADE
);

    -- Booking Table
    CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY
    (user_id) REFERENCES User
    (user_id) ON
    DELETE CASCADE,
    FOREIGN KEY (property_id)
    REFERENCES Property
    (property_id) ON
    DELETE CASCADE
);

    -- Payment Table
    CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY
    (booking_id) REFERENCES Booking
    (booking_id) ON
    DELETE CASCADE
);

    -- Review Table
    CREATE TABLE Review
    (
        review_id UUID PRIMARY KEY,
        user_id UUID NOT NULL,
        property_id UUID NOT NULL,
        rating INTEGER CHECK (rating BETWEEN 1 AND 5),
        comment TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
        FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
    );

    -- Message Table
    CREATE TABLE Message
    (
        message_id UUID PRIMARY KEY,
        sender_id UUID NOT NULL,
        recipient_id UUID NOT NULL,
        message_body TEXT NOT NULL,
        sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
        FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
    );

    -- Indexes for Performance
    CREATE INDEX idx_user_email ON User(email);
    CREATE INDEX idx_property_location ON Property(location);
    CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
