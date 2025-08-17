# mysql-student-enrollment

A simple MySQL 8.x schema for students, courses, and enrollments with sample data and example queries.

## Prerequisites

- MySQL 8.x
- MySQL Workbench **or** mysql CLI
- Git

## How to run

### Using MySQL Workbench

1. Open `schema.sql` and Run (creates DB/tables).
2. Open `data.sql` and Run (inserts sample data).
3. Open `queries.sql` and Run specific blocks.

### Using CLI

```bash
mysql -u root -p < schema.sql
mysql -u root -p < data.sql
mysql -u root -p < queries.sql
```
