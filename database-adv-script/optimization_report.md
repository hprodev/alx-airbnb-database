# Query Optimization Report

## 1. Initial Query Analysis

- The initial query retrieved all bookings along with user, property, and payment details using multiple JOINs.
- Performance Issue:
  - Full table scans due to lack of indexing.
  - No filtering, causing excessive data retrieval.
  - Sorting was not optimized.

---

## 2. Refactoring Steps

- Added a WHERE clause to filter bookings to only 'confirmed' status.
- Added an ORDER BY clause to sort by booking date in descending order.
- Created indexes on frequently used columns in the JOIN and WHERE clauses.

---

## 3. Performance Improvement

- Reduced query execution time due to filtered data retrieval.
- Optimized sorting using indexed columns.
- Reduced full table scans using indexes.
