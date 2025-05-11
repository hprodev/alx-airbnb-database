# Airbnb Clone Database Schema

## 📌 Introduction

This directory contains the SQL schema (DDL) for the Airbnb Clone project. The `schema.sql` file defines the database tables, constraints, relationships, and indexes needed for the backend of the application.

---

## 🚀 How to Use

1. Ensure you have a PostgreSQL database set up.
2. Clone this repository and navigate to this directory:

   ```bash
   git clone https://github.com/your-username/alx-airbnb-database.git
   cd alx-airbnb-database/database-script-0x01
   ```

3. Connect to your PostgreSQL database:

   ```bash
   psql -U your_username -d your_database
   ```

4. Execute the schema file:

   ```bash
   \i schema.sql
   ```

---

## 📂 Schema Overview

The database schema consists of the following tables:

* **User:** Stores user details (guest, host, admin).
* **Property:** Stores details of listed properties, linked to hosts.
* **Booking:** Manages property reservations by users.
* **Payment:** Tracks payments for bookings.
* **Review:** Allows users to leave reviews on properties.
* **Message:** Manages messages between users.

---

## ✅ Constraints and Indexes

* **Primary Keys:** Each table has a primary key for unique identification.
* **Foreign Keys:** Enforce relationships between tables with `ON DELETE CASCADE`.
* **Indexes:**

  * `User.email` - for fast user lookup by email.
  * `Property.location` - for efficient property search by location.
  * `Booking.start_date, end_date` - for efficient booking range searches.

---

## ⚡ Improvements

* The Booking table does not store `total_price` (calculated when needed).
* Tables use UUIDs for primary keys for scalability.
* The database is optimized with indexes for performance.

---

## 📌 License

This database schema is part of the Airbnb Clone project and is licensed under the MIT License.
