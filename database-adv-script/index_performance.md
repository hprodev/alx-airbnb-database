
# Database Index Optimization

This document demonstrates how to identify high-usage columns in the `User`, `Booking`, and `Property` tables,
create indexes for them, and measure query performance before and after indexing.

---

## 1. Identify High-Usage Columns

### User Table

- Frequently used columns:
  - **WHERE:** `email`, `user_id`
  - **JOIN:** `user_id`
  - **ORDER BY:** `created_at`

### Booking Table

- Frequently used columns:
  - **WHERE:** `booking_id`, `user_id`, `property_id`, `status`
  - **JOIN:** `user_id`, `property_id`
  - **ORDER BY:** `created_at`

### Property Table

- Frequently used columns:
  - **WHERE:** `property_id`, `owner_id`, `location`
  - **JOIN:** `property_id`, `owner_id`
  - **ORDER BY:** `created_at`

---

## 2. SQL CREATE INDEX Commands

```sql
-- Database Indexes (database_index.sql)

-- Indexes for User Table
CREATE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_user_id ON User (user_id);
CREATE INDEX idx_user_created_at ON User (created_at);

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
```

---

## 3. Measure Query Performance Before and After Indexing

### Before Adding Indexes

```sql
-- Example Query
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE user_id = 123 AND status = 'confirmed';
```

### After Adding Indexes

```sql
-- Example Query
EXPLAIN ANALYZE 
SELECT * 
FROM Booking 
WHERE user_id = 123 AND status = 'confirmed';
```

### Comparing Performance

- Compare the **Execution Time** and **Cost** values between the two query results.
- A lower cost and faster execution time after indexing indicate successful optimization.

---

## 4. Recommended Improvement (Optional)

- Use a script to automate the performance measurement before and after index creation.
- Adjust indexing strategies based on the actual query patterns and usage.
