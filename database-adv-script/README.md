# Advanced Queries - Airbnb Clone

## Overview

This document outlines advanced SQL queries for the Airbnb Clone backend, including joins, subqueries, aggregation, window functions, indexing, partitioning, and performance optimization. These queries are designed to retrieve relational data from the database efficiently and optimize performance.

## Purpose

### Existing Query Types

- **INNER JOIN:** Retrieves bookings with matching users.
- **LEFT JOIN:** Lists all properties, including those without reviews.
- **FULL OUTER JOIN:** Shows all users and bookings, even if one doesn't match the other.
- **Non-Correlated Subquery:** Finds properties with an average rating greater than 4.0.
- **Correlated Subquery:** Finds users who have made more than 3 bookings.
- **Aggregation (COUNT + GROUP BY):** Calculates the total number of bookings made by each user.
- **Window Function (RANK):** Ranks properties based on the total number of bookings they have received.

### Additional Tasks Covered

- **Indexing:** Identified high-usage columns and created indexes on User, Booking, and Property tables to improve query performance. Included examples of measuring performance before and after indexing using `EXPLAIN ANALYZE`.
- **Query Optimization:** Refactored complex queries involving multiple joins (User, Booking, Property, Payment) to reduce execution time with filtering and indexing.
- **Partitioning:** Implemented table partitioning on the Booking table based on the `start_date` column (yearly partitions) to optimize large dataset queries. Included trigger-based partitioning approach compatible with PostgreSQL.
- **Performance Monitoring:** Demonstrated how to monitor query performance using `EXPLAIN ANALYZE`, identify bottlenecks, suggest schema/index changes, implement improvements, and report the outcomes.

## Directory

- `database-adv-script/`  
  Contains SQL scripts for advanced queries, indexing, partitioning, and performance monitoring.

## Repository

- GitHub repository: [alx-airbnb-database](https://github.com/hprodev/alx-airbnb-database)

---
