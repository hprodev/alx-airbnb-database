# Advanced Queries - Airbnb Clone

## Overview

This document outlines advanced SQL queries for the Airbnb Clone backend, including joins, subqueries, aggregation, and window functions. These queries are designed to retrieve relational data from the database efficiently.

## Purpose

- **INNER JOIN**: Retrieves bookings with matching users.
- **LEFT JOIN**: Lists all properties, including those without reviews.
- **FULL OUTER JOIN**: Shows all users and bookings, even if one doesn't match the other.
- **Non-Correlated Subquery**: Finds properties with an average rating greater than 4.0.
- **Correlated Subquery**: Finds users who have made more than 3 bookings.
- **Aggregation (COUNT + GROUP BY)**: Calculates the total number of bookings made by each user.
- **Window Function (RANK)**: Ranks properties based on the total number of bookings they have received.
