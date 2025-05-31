# Security Scenario: When Access Goes Wrong
<ins> Scenario: "The Overpowered Developer" 

You’re part of a company building an internal Payroll Management System. During 
development, a database developer named Adil was given full control on the production 
database to “speed up” testing and updates. However, the following problems occurred:

<ins> What Went Wrong 
1. Accidental Data Deletion 
	* *Adil ran a DELETE FROM Employees command thinking he was connected to the 
	test database. 
	** No backup was taken before running the query. 
2. Salary Data Leaked 
	* Adil created a report for testing that included all employee salaries. 		
	* He shared the exported Excel file with an external UI developer by mistake. 
3. Unauthorized Role Creation 
	* To “help,” Adil created a new SQL login for a junior developer without informing the DB admin. 
	* The junior dev used that login to explore the entire database, including sensitive HR data. 
4. Schema Confusion 
	* Adil created new tables inside the wrong schema (dbo instead of HR) which caused permission issues for HR team users. 

### 1. Summary of the Problems

List and describe what went wrong (based on the points above):

1. **Accidental Data Deletion**: Adil mistakenly deleted all employee records from the production database, thinking he was working in a test environment. This resulted in a significant loss of critical data without any backup to restore it.
2. **Salary Data Leaked**: Adil created a report containing sensitive salary information and accidentally shared it with an external developer, exposing confidential employee data.
3. **Unauthorized Role Creation**: Adil created a new SQL login for a junior developer without informing the database administrator, allowing the junior developer to access sensitive HR data that they should not have been able to see.
4. **Schema Confusion**: Adil created new tables in the wrong schema (dbo instead of HR), leading to permission issues for HR team users who were unable to access the data they needed.
