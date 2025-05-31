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
**1.  Create SQL logins and map them to users inside the database.**
	
 directly in SQL Server Management Studio (SSMS):
1. Open SSMS and connect to your SQL Server instance.
2. In Object Explorer, expand the "Security" node.
3. Right-click on "Logins" and select "New Login...".
4. Enter the login name (e.g., `hr_login` for HR and `sales_login` for Sales).
5. Set the password and configure other options as needed.
6. Click "OK" to create the login.
!['login procee'](login.JPG)

Or by use sql script 
```
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
```
**2. Create two schemas: HR and Sales.**
```
-- ================================ Schema =======================================
-- Create schemas
CREATE SCHEMA HR AUTHORIZATION HrUser;
CREATE SCHEMA Sales AUTHORIZATION SalesUser;

```
