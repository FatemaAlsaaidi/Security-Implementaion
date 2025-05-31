-- Create SQL Logins and Map to Users
-- ==================================== HR Login and User ================================
-- Create login for HR
CREATE LOGIN HrLogin WITH PASSWORD = '123';
-- Create user in the database for HR
CREATE USER HrUser FOR LOGIN HrLogin;

-- =================================== Sales Login and User ===================================
-- Create login for Sales
CREATE LOGIN SalesLogin WITH PASSWORD = '456';
-- Create user in the database for Sales
CREATE USER SalesUser FOR LOGIN SalesLogin;

-- Create HR and Sales Schemas

-- ================================ Schema =======================================
-- Create schemas
CREATE SCHEMA HR AUTHORIZATION HrUser;
CREATE SCHEMA Sales AUTHORIZATION SalesUser;

-- ========================= Create Sample Tables ================================
-- Inside HR Schema
CREATE TABLE HR.Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50)
);

INSERT INTO HR.Employees VALUES (1, 'Alice Johnson', 'HR Manager');

-- Inside Sales Schema
CREATE TABLE Sales.Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Sales.Customers VALUES (101, 'Global Corp', 'contact@global.com');

--=================================== Assign Schema-Level Permissions ===========================
-- Grant HR User Access to HR Schema Only
-- Allow HR user access to HR schema
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::HR TO HrUser;
-- Deny access to Sales schema
DENY SELECT ON SCHEMA::Sales TO HrUser;

-- Grant Sales User Access to Sales Schema Only
-- Allow Sales user access to Sales schema
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::Sales TO SalesUser;
-- Deny access to HR schema
DENY SELECT ON SCHEMA::HR TO SalesUser;

--======================= Test the Access ========================================
-- Connect as HrLogin:
-- As hr_user
EXECUTE AS USER = 'HrUser';
SELECT * FROM HR.Employees;
SELECT * FROM Sales.Customers;

delete from HR.Employees; -- This will fail with permission denied error
insert into HR.Employees VALUES (1, 'Alice Johnson', 'HR Manager');


-- Connect as SalesLogin
EXECUTE AS USER = 'SalesUser';
SELECT * FROM Sales.Customers;
SELECT * FROM HR.Employees;

