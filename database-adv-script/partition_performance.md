# Partitioning Performance Report

## 1. Introduction

- The Booking table is a large table with many rows, making query performance slow.
- We implemented partitioning on the Booking table using the start_date column (yearly partitioning).
- This approach ensures that each year has its own partition, making date-based queries faster.

---

## 2. Partitioning Implementation

- The Booking table was partitioned using the RANGE method based on the start_date column.
- Three partitions were created for the years 2023, 2024, and 2025.
- Data was transferred from the original Booking table to the partitioned table.

---

## 3. Query Performance Analysis

- Querying the partitioned table was significantly faster than the non-partitioned table.
- The EXPLAIN ANALYZE command showed that the query planner only accessed the relevant partition, skipping unrelated data.

### Example

- Non-Partitioned Query (Original Table):  
  - Execution Time: ~500ms(assumed) for a large table.
- Partitioned Query (Partitioned Table):  
  - Execution Time: ~100ms(assumed) (80% improvement).
