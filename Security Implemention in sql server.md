# Task: Enforcing Schema-Level Access in a Company Database 

# Security Implementation in SQL Server
*<ins>*Scenario** 

You are the database administrator of a system that contains two main departments: 

• HR (Human Resources) 

• Sales

Each department has its own schema in the database.
- Your job is to restrict access so that each department only views and works with its own data. 

- Objective 
1. Create SQL logins and map them to users inside the database. 
2. Create two schemas: HR and Sales. 
3. Create a few sample tables inside each schema. 
4. Assign schema-level permissions so: 
	- HR users cannot access Sales data. 
	- Sales users cannot access HR data.

*<ins>*Task**
1. create simple data base 
````sql

CREATE DATABASE CompanyDB;
USE CompanyDB;

-- HR Employees table 
CREATE TABLE HR_Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    HireDate DATE,
    JobTitle NVARCHAR(100),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2)
);

-- HR Department table 
CREATE TABLE HR_Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(50),
    ManagerID INT FOREIGN KEY REFERENCES HR_Employees(EmployeeID)
);

-- Sales Customer table
CREATE TABLE Sales_Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(255)
);
-- Sales Order Table
CREATE TABLE Sales_Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Sales_Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);
-- Sales Representatives Table
CREATE TABLE Sales_Representatives (
    RepID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    HireDate DATE,
    Region NVARCHAR(50)
);
-- Link Between Sales Orders and Sales Representatives
ALTER TABLE Sales_Orders
ADD RepID INT FOREIGN KEY REFERENCES Sales_Representatives(RepID);

-- Insert Data into HR_Employees
INSERT INTO HR_Employees (FirstName, LastName, DateOfBirth, HireDate, JobTitle, Department, Salary)
VALUES 
('Ali', 'Al-Rashdi', '1990-03-15', '2020-01-10', 'HR Manager', 'HR', 3500.00),
('Sara', 'Al-Harthi', '1995-07-22', '2022-05-01', 'Recruiter', 'HR', 2500.00),
('Omar', 'Al-Zadjali', '1988-11-02', '2018-09-15', 'HR Specialist', 'HR', 2800.00);

-- Insert Data into HR_Departments
INSERT INTO HR_Departments (DepartmentName, ManagerID)
VALUES 
('Human Resources', 1);

-- Insert Data into Sales_Customers
INSERT INTO Sales_Customers (FirstName, LastName, Email, PhoneNumber, Address)
VALUES 
('Fatma', 'Al-Balushi', 'fatma.b@example.com', '91234567', 'Muscat, Oman'),
('Khalid', 'Al-Lawati', 'khalid.l@example.com', '92345678', 'Sohar, Oman'),
('Mona', 'Al-Mahrouqi', 'mona.m@example.com', '93456789', 'Nizwa, Oman');

-- Insert Data into Sales_Representatives
INSERT INTO Sales_Representatives (FirstName, LastName, Email, HireDate, Region)
VALUES 
('Hassan', 'Al-Kindi', 'hassan.k@example.com', '2021-02-01', 'Muscat'),
('Noor', 'Al-Hinai', 'noor.h@example.com', '2023-03-12', 'Salalah');

-- Insert Data into Sales_Orders
INSERT INTO Sales_Orders (CustomerID, OrderDate, TotalAmount, RepID)
VALUES 
(1, '2024-04-10', 500.00, 1),
(2, '2024-04-15', 750.50, 2),
(3, '2024-04-20', 300.75, 1);

````

2. Create two schemas: `HR` and `Sales`.
```sql
CREATE SCHEMA HR;
CREATE SCHEMA Sales;
```




