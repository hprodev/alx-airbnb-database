# Airbnb Database Normalization

## Introduction

This document outlines the normalization process applied to the Airbnb Clone database. Our goal was to ensure that all tables in the database are in Third Normal Form (3NF) to eliminate redundancy and ensure data integrity.

---

## Normalization Review

### User Table

* ✅ **1NF:** No repeating groups.
* ✅ **2NF:** All attributes depend on the primary key (`user_id`).
* ✅ **3NF:** No transitive dependencies.

### Property Table

* ✅ **1NF:** No repeating groups.
* ✅ **2NF:** All attributes depend on the primary key (`property_id`).
* ✅ **3NF:** No transitive dependencies.

### Booking Table

* ✅ **1NF:** No repeating groups.
* ✅ **2NF:** All attributes depend on the primary key (`booking_id`).
* ❌ **3NF Issue:**

  * The `total_price` attribute is a calculated value (`pricepernight * (end_date - start_date)`).

#### ⚡ **Solution:**

* Remove `total_price` from the Booking table.
* Calculate it dynamically when needed:

```sql
SELECT (DATEDIFF(end_date, start_date) * pricepernight) AS total_price
FROM Booking
JOIN Property ON Booking.property_id = Property.property_id;
```

### Payment Table

* ✅ **1NF:** No repeating groups.
* ✅ **2NF:** All attributes depend on the primary key (`payment_id`).
* ✅ **3NF:** No transitive dependencies.

### Review Table

* ✅ **1NF:** No repeating groups.
* ✅ **2NF:** All attributes depend on the primary key (`review_id`).
* ✅ **3NF:** No transitive dependencies.

### Message Table

* ✅ **1NF:** No repeating groups.
* ✅ **2NF:** All attributes depend on the primary key (`message_id`).
* ✅ **3NF:** No transitive dependencies.

---

## Conclusion

The Airbnb Clone database is now fully normalized to 3NF, ensuring data integrity, consistency, and scalability.
