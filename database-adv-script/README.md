# SQL Join Queries – Airbnb Clone Backend

This document explains the SQL join queries used to retrieve relational data from the Airbnb Clone database.

These queries help analyze how users, bookings, properties, and reviews are connected in the system.

---

## 🎯 Overview

Joins are used to combine related data from multiple tables using shared keys.

The following queries demonstrate different types of joins:

- `INNER JOIN`
- `LEFT JOIN`
- `FULL OUTER JOIN`

---

## 📋 Purpose

Each query serves a specific purpose:

| Query Type       | Purpose |
|------------------|---------|
| INNER JOIN       | Retrieve bookings that have matching users |
| LEFT JOIN        | List all properties including those without reviews |
| FULL OUTER JOIN  | Show all users and bookings, even if one doesn't match the other |

These queries are useful for reporting, analytics, and understanding user behavior and property usage.
