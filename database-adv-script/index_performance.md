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

## 2. SQL Commands

Refer to the `database_index.sql` file for the SQL commands to create indexes and measure query performance.
