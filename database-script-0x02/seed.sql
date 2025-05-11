-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid1', 'Tunde', 'Adebayo', 'tunde.adebayo@example.com', 'hashed_password_1', '+2348012345678', 'host', NOW()),
('uuid2', 'Bisi', 'Ogunleye', 'bisi.ogunleye@example.com', 'hashed_password_2', '+2348087654321', 'guest', NOW()),
('uuid3', 'Chidi', 'Nwabudike', 'chidi.nwabudike@example.com', 'hashed_password_3', NULL, 'guest', NOW()),
('uuid4', 'Funke', 'Akande', 'funke.akande@example.com', 'hashed_password_4', '+2348055555555', 'host', NOW()),
('uuid5', 'Admin', 'One', 'admin@example.com', 'admin_hashed_pass', NULL, 'admin', NOW());

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
('prop1', 'uuid1', 'Lagos Luxury Apartment', 'Modern apartment in Lekki with ocean view.', 'Lagos, Nigeria', 50.00, NOW(), NOW()),
('prop2', 'uuid1', 'Abuja Executive Suite', 'Spacious suite near the city center.', 'Abuja, Nigeria', 70.00, NOW(), NOW()),
('prop3', 'uuid4', 'Ibadan Cozy Cottage', 'Traditional cottage with garden and parking.', 'Ibadan, Nigeria', 30.00, NOW(), NOW());

-- Insert Bookings
INSERT INTO Booking (booking_id, user_id, property_id, start_date, end_date, status, created_at) VALUES
('book1', 'uuid2', 'prop1', '2025-04-01', '2025-04-05', 'confirmed', NOW()),
('book2', 'uuid3', 'prop2', '2025-04-10', '2025-04-15', 'pending', NOW()),
('book3', 'uuid2', 'prop3', '2025-05-01', '2025-05-03', 'confirmed', NOW()),
('book4', 'uuid3', 'prop1', '2025-06-01', '2025-06-04', 'canceled', NOW());

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay1', 'book1', 200.00, NOW(), 'credit_card'),
('pay2', 'book3', 90.00, NOW(), 'paypal'),
('pay3', 'book4', 150.00, NOW(), 'stripe');

-- Insert Reviews
INSERT INTO Review (review_id, user_id, property_id, rating, comment, created_at) VALUES
('rev1', 'uuid2', 'prop1', 5, 'Amazing stay! Highly recommended.', NOW()),
('rev2', 'uuid3', 'prop2', 4, 'Very comfortable but could be cleaner.', NOW());

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg1', 'uuid2', 'uuid1', 'Hi Tunde, I am interested in your Lagos apartment!', NOW()),
('msg2', 'uuid1', 'uuid2', 'Hello Bisi, sure! Let me send more info.', NOW()),
('msg3', 'uuid3', 'uuid4', 'Hey Funke, do you allow pets?', NOW());