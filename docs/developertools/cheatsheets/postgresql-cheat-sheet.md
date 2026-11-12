# PostgreSQL Commands

## Introduction

PostgreSQL is a powerful, open-source object-relational database system with over 35 years of active development. It's known for reliability, feature robustness, and performance. This cheat sheet provides essential commands for database administration, development, and troubleshooting in PostgreSQL environments, including Azure PostgreSQL deployments.

**Related Articles:** [AKS Pod Connection to PostgreSQL using Workload Identity](../../articles/20251113.1-aks-workload-identity.md)

---

## Installation

### Windows

``` powershell
# Using Chocolatey
choco install postgresql

# Using installer from official website
# Download from: https://www.postgresql.org/download/windows/
```

### macOS

``` bash
# Using Homebrew
brew install postgresql@16

# Start PostgreSQL service
brew services start postgresql@16

# Stop PostgreSQL service
brew services stop postgresql@16
```

### Linux (Ubuntu/Debian)

``` bash
# Install PostgreSQL
sudo apt update
sudo apt install postgresql postgresql-contrib

# Start PostgreSQL service
sudo systemctl start postgresql

# Enable on boot
sudo systemctl enable postgresql

# Check status
sudo systemctl status postgresql
```

### Using Docker

``` bash
# Pull PostgreSQL image
docker pull postgres:16

# Run PostgreSQL container
docker run --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -e POSTGRES_DB=mydb \
  -p 5432:5432 \
  -d postgres:16

# Run with persistent volume
docker run --name postgres-dev \
  -e POSTGRES_PASSWORD=mysecretpassword \
  -e POSTGRES_DB=mydb \
  -v postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  -d postgres:16
```

---

## Connecting to PostgreSQL

### Using psql Command Line

``` bash
# Connect to local database
psql -U postgres

# Connect to specific database
psql -U username -d database_name

# Connect to remote host
psql -h hostname -U username -d database_name -p 5432

# Connect with password prompt
psql -h hostname -U username -d database_name -W

# Connect using connection string
psql "postgresql://username:password@hostname:5432/database_name"
```

### Using Environment Variables

``` bash
# Set connection parameters
export PGHOST=localhost
export PGPORT=5432
export PGUSER=myuser
export PGPASSWORD=mypassword
export PGDATABASE=mydb

# Connect using environment variables
psql
```

### Azure PostgreSQL Flexible Server

``` bash
# Connect to Azure PostgreSQL
psql "host=myserver.postgres.database.azure.com \
      port=5432 \
      dbname=mydb \
      user=myadmin \
      password=mypassword \
      sslmode=require"

# Using Azure AD authentication
psql "host=myserver.postgres.database.azure.com \
      port=5432 \
      dbname=mydb \
      user=myuser@myserver \
      sslmode=require"
```

---

## Database Management

### List and View Databases

``` sql
-- List all databases
\l
\list

-- Connect to a database
\c database_name
\connect database_name

-- Show current database
SELECT current_database();

-- Show database size
SELECT pg_database.datname, 
       pg_size_pretty(pg_database_size(pg_database.datname)) AS size 
FROM pg_database;
```

### Create and Drop Databases

``` sql
-- Create database
CREATE DATABASE mydb;

-- Create database with owner
CREATE DATABASE mydb OWNER myuser;

-- Create database with encoding
CREATE DATABASE mydb 
  ENCODING 'UTF8' 
  LC_COLLATE 'en_US.UTF-8' 
  LC_CTYPE 'en_US.UTF-8';

-- Drop database
DROP DATABASE mydb;

-- Drop database if exists
DROP DATABASE IF EXISTS mydb;
```

---

## User & Role Management

### Create and Manage Users

``` sql
-- Create user with password
CREATE USER myuser WITH PASSWORD 'mypassword';

-- Create user with additional privileges
CREATE USER myuser WITH 
  PASSWORD 'mypassword'
  CREATEDB
  CREATEROLE;

-- Alter user password
ALTER USER myuser WITH PASSWORD 'newpassword';

-- Drop user
DROP USER myuser;

-- List all users
\du

-- Grant privileges to user
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;

-- Revoke privileges
REVOKE ALL PRIVILEGES ON DATABASE mydb FROM myuser;
```

### Role Management

``` sql
-- Create role
CREATE ROLE readonly;

-- Grant role to user
GRANT readonly TO myuser;

-- Create role with login
CREATE ROLE myuser WITH LOGIN PASSWORD 'mypassword';

-- Grant specific permissions to role
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;

-- Set default privileges for role
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT ON TABLES TO readonly;
```

---

## Table Operations

### Create Tables

``` sql
-- Basic table creation
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table with foreign key
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2)
);

-- Create table from query
CREATE TABLE archived_orders AS
SELECT * FROM orders WHERE order_date < '2024-01-01';
```

### List and Describe Tables

``` sql
-- List all tables in current database
\dt

-- List tables in specific schema
\dt schema_name.*

-- Describe table structure
\d table_name

-- Show table with details
\d+ table_name

-- Show table columns
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'employees';
```

### Alter Tables

``` sql
-- Add column
ALTER TABLE employees ADD COLUMN phone VARCHAR(20);

-- Drop column
ALTER TABLE employees DROP COLUMN phone;

-- Rename column
ALTER TABLE employees RENAME COLUMN name TO full_name;

-- Change column type
ALTER TABLE employees ALTER COLUMN salary TYPE NUMERIC(12, 2);

-- Add constraint
ALTER TABLE employees ADD CONSTRAINT salary_positive CHECK (salary > 0);

-- Rename table
ALTER TABLE employees RENAME TO staff;
```

### Drop Tables

``` sql
-- Drop table
DROP TABLE employees;

-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- Drop table and dependent objects
DROP TABLE employees CASCADE;
```

---

## Data Manipulation

### Insert Data

``` sql
-- Insert single row
INSERT INTO employees (name, email, department, salary)
VALUES ('John Doe', 'john@example.com', 'Engineering', 75000);

-- Insert multiple rows
INSERT INTO employees (name, email, department, salary)
VALUES 
  ('Jane Smith', 'jane@example.com', 'Marketing', 65000),
  ('Bob Johnson', 'bob@example.com', 'Sales', 70000);

-- Insert with returning
INSERT INTO employees (name, email)
VALUES ('Alice Brown', 'alice@example.com')
RETURNING id, created_at;

-- Insert from select
INSERT INTO archived_employees
SELECT * FROM employees WHERE hire_date < '2020-01-01';
```

### Select Data

``` sql
-- Select all columns
SELECT * FROM employees;

-- Select specific columns
SELECT name, department, salary FROM employees;

-- Select with WHERE clause
SELECT * FROM employees WHERE department = 'Engineering';

-- Select with multiple conditions
SELECT * FROM employees 
WHERE department = 'Engineering' AND salary > 70000;

-- Select with LIKE
SELECT * FROM employees WHERE name LIKE 'John%';

-- Select with IN
SELECT * FROM employees WHERE department IN ('Engineering', 'Sales');

-- Select with ORDER BY
SELECT * FROM employees ORDER BY salary DESC;

-- Select with LIMIT
SELECT * FROM employees ORDER BY salary DESC LIMIT 10;

-- Select with aggregation
SELECT department, COUNT(*), AVG(salary) as avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
```

### Update Data

``` sql
-- Update single row
UPDATE employees 
SET salary = 80000 
WHERE id = 1;

-- Update multiple columns
UPDATE employees 
SET salary = salary * 1.1, 
    department = 'Senior Engineering'
WHERE department = 'Engineering' AND salary > 75000;

-- Update with returning
UPDATE employees 
SET salary = 85000 
WHERE id = 1
RETURNING *;
```

### Delete Data

``` sql
-- Delete specific rows
DELETE FROM employees WHERE id = 1;

-- Delete with condition
DELETE FROM employees WHERE hire_date < '2020-01-01';

-- Delete all rows (use with caution)
DELETE FROM employees;

-- Delete with returning
DELETE FROM employees WHERE id = 1 RETURNING *;

-- Truncate table (faster than DELETE)
TRUNCATE TABLE employees;

-- Truncate with cascade
TRUNCATE TABLE employees CASCADE;
```

---

## Indexes

### Create and Manage Indexes

``` sql
-- Create index
CREATE INDEX idx_employees_email ON employees(email);

-- Create unique index
CREATE UNIQUE INDEX idx_employees_email_unique ON employees(email);

-- Create multi-column index
CREATE INDEX idx_employees_dept_salary ON employees(department, salary);

-- Create partial index
CREATE INDEX idx_active_employees ON employees(email) 
WHERE active = true;

-- List all indexes
\di

-- Show indexes for specific table
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'employees';

-- Drop index
DROP INDEX idx_employees_email;
```

---

## Query Optimization

### EXPLAIN and ANALYZE

``` sql
-- Show query execution plan
EXPLAIN SELECT * FROM employees WHERE department = 'Engineering';

-- Show execution plan with costs
EXPLAIN (COSTS ON) SELECT * FROM employees WHERE salary > 70000;

-- Analyze and execute query
EXPLAIN ANALYZE SELECT * FROM employees WHERE department = 'Engineering';

-- Detailed analysis
EXPLAIN (ANALYZE, BUFFERS, VERBOSE) 
SELECT * FROM employees 
WHERE department = 'Engineering';
```

### Performance Monitoring

``` sql
-- Show running queries
SELECT pid, usename, application_name, state, query
FROM pg_stat_activity
WHERE state = 'active';

-- Show slow queries
SELECT query, mean_exec_time, calls
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 10;

-- Show table statistics
SELECT schemaname, tablename, 
       seq_scan, seq_tup_read, 
       idx_scan, idx_tup_fetch
FROM pg_stat_user_tables;

-- Show cache hit ratio
SELECT 
  sum(heap_blks_read) as heap_read,
  sum(heap_blks_hit) as heap_hit,
  sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) as ratio
FROM pg_statio_user_tables;
```

---

## Backup & Restore

### Using pg_dump

``` bash
# Backup single database
pg_dump -U postgres mydb > mydb_backup.sql

# Backup with custom format (compressed)
pg_dump -U postgres -Fc mydb > mydb_backup.dump

# Backup specific tables
pg_dump -U postgres -t employees -t departments mydb > tables_backup.sql

# Backup to remote server
pg_dump -h remote-host -U postgres mydb > mydb_backup.sql

# Backup all databases
pg_dumpall -U postgres > all_databases.sql

# Backup only schema
pg_dump -U postgres --schema-only mydb > schema_only.sql

# Backup only data
pg_dump -U postgres --data-only mydb > data_only.sql
```

### Using pg_restore

``` bash
# Restore from custom format
pg_restore -U postgres -d mydb mydb_backup.dump

# Restore with clean option (drop existing objects)
pg_restore -U postgres -d mydb --clean mydb_backup.dump

# Restore specific table
pg_restore -U postgres -d mydb -t employees mydb_backup.dump

# Restore to different database
pg_restore -U postgres -d newdb mydb_backup.dump

# Restore from plain SQL
psql -U postgres mydb < mydb_backup.sql
```

### Azure PostgreSQL Backup

``` bash
# Backup Azure PostgreSQL database
pg_dump -h myserver.postgres.database.azure.com \
  -U myadmin@myserver \
  -d mydb \
  -Fc > azure_backup.dump

# Restore to Azure PostgreSQL
pg_restore -h myserver.postgres.database.azure.com \
  -U myadmin@myserver \
  -d mydb \
  --no-owner \
  --no-privileges \
  azure_backup.dump
```

---

## Common Use Cases

### Working with JSON Data

``` sql
-- Create table with JSON column
CREATE TABLE api_logs (
    id SERIAL PRIMARY KEY,
    request_data JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert JSON data
INSERT INTO api_logs (request_data)
VALUES ('{"user_id": 123, "action": "login", "ip": "192.168.1.1"}');

-- Query JSON data
SELECT request_data->>'user_id' as user_id,
       request_data->>'action' as action
FROM api_logs;

-- Query nested JSON
SELECT request_data->'user'->>'name' as username
FROM api_logs;

-- Create index on JSON field
CREATE INDEX idx_request_user_id ON api_logs ((request_data->>'user_id'));
```

### Working with Arrays

``` sql
-- Create table with array column
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    tags TEXT[]
);

-- Insert array data
INSERT INTO projects (name, tags)
VALUES ('Project A', ARRAY['urgent', 'backend', 'api']);

-- Query array data
SELECT * FROM projects WHERE 'urgent' = ANY(tags);

-- Array operations
SELECT name, array_length(tags, 1) as tag_count
FROM projects;
```

### Transactions

``` sql
-- Begin transaction
BEGIN;

-- Perform operations
INSERT INTO accounts (name, balance) VALUES ('Alice', 1000);
UPDATE accounts SET balance = balance - 100 WHERE name = 'Bob';

-- Commit transaction
COMMIT;

-- Rollback transaction
ROLLBACK;

-- Savepoint
BEGIN;
INSERT INTO logs (message) VALUES ('Step 1');
SAVEPOINT step1;
INSERT INTO logs (message) VALUES ('Step 2');
ROLLBACK TO step1;
COMMIT;
```

---

## Troubleshooting

### Connection Issues

``` sql
-- Check PostgreSQL is running
sudo systemctl status postgresql

-- Check listening ports
sudo netstat -plnt | grep postgres

-- Show connection limits
SHOW max_connections;

-- Show current connections
SELECT count(*) FROM pg_stat_activity;

-- Kill idle connections
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE state = 'idle' AND state_change < NOW() - INTERVAL '10 minutes';
```

### Permission Issues

``` sql
-- Check user permissions
\du username

-- Grant all privileges
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;

-- Grant table permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO myuser;

-- Grant sequence permissions
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO myuser;

-- Reset ownership
ALTER DATABASE mydb OWNER TO newowner;
```

### Performance Issues

``` sql
-- Find slow queries
SELECT pid, now() - pg_stat_activity.query_start AS duration, query
FROM pg_stat_activity
WHERE state = 'active' AND now() - pg_stat_activity.query_start > interval '5 minutes';

-- Find missing indexes
SELECT schemaname, tablename, attname, n_distinct, correlation
FROM pg_stats
WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
AND n_distinct > 100
ORDER BY n_distinct DESC;

-- Vacuum and analyze
VACUUM ANALYZE employees;

-- Full vacuum
VACUUM FULL employees;

-- Reindex table
REINDEX TABLE employees;
```

### Azure PostgreSQL Specific

``` sql
-- Check server parameters
SHOW ALL;

-- Check Azure extensions
SELECT * FROM pg_available_extensions ORDER BY name;

-- Install extension
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- Check replication lag (for read replicas)
SELECT EXTRACT(EPOCH FROM (now() - pg_last_xact_replay_timestamp())) AS replication_lag_seconds;
```

---

## psql Meta-Commands

``` sql
-- Help
\?

-- List databases
\l

-- List tables
\dt

-- List schemas
\dn

-- List functions
\df

-- List views
\dv

-- Describe table
\d table_name

-- Execute SQL from file
\i filename.sql

-- Output to file
\o output.txt

-- Timing queries
\timing

-- Quit psql
\q
```

---

## Environment Variables

``` bash
# Connection settings
export PGHOST=localhost
export PGPORT=5432
export PGUSER=myuser
export PGPASSWORD=mypassword
export PGDATABASE=mydb

# SSL settings
export PGSSLMODE=require
export PGSSLCERT=/path/to/cert.pem
export PGSSLKEY=/path/to/key.pem

# Client encoding
export PGCLIENTENCODING=UTF8
```

---

## References

- [PostgreSQL Official Documentation](https://www.postgresql.org/docs/)
- [Azure Database for PostgreSQL Documentation](https://docs.microsoft.com/en-us/azure/postgresql/)
- [AKS Pod Connection to PostgreSQL using Workload Identity](../../articles/20251113.1-aks-workload-identity.md)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [pgAdmin - PostgreSQL Administration Tool](https://www.pgadmin.org/)

---

**Last Updated:** December 30, 2025
