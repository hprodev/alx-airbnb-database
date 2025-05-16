# Performance Monitoring Report

## Queries Monitored

- Query 1: Fetch confirmed bookings with recent start dates.
- Query 2: (List others you monitor)

## Bottlenecks Identified

- Sequential scans on Booking.status and Booking.start_date.

## Changes Implemented

- Added composite index on Booking(status, start_date).

## Performance Improvements

- Query 1 execution time reduced from X ms to Y ms.
- Index scans replaced sequential scans, improving efficiency.
