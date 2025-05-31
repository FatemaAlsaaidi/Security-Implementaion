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

### 2. Root Causes 

Identify the security flaws:

• No separation between development and production:

-Adil had full access to the production database, allowing him to make changes without proper oversight or controls.

• Full access given to developers :
	
-Developers were granted unrestricted access to the production database, enabling them to perform actions that could compromise data integrity and security.

• No schema-level restrictions :
	
-here were no schema-level restrictions in place, allowing Adil to create tables in the wrong schema and causing permission issues for other users.

• Lack of role-based permission control:

-There was no role-based permission control, allowing Adil to create new logins and grant access to sensitive data without proper authorization.

### 3. Suggested Solutions

Explain how these issues could have been avoided using: 
• Schema-level permissions:
- Implementing schema-level permissions would have restricted Adil's ability to create tables in the wrong schema, ensuring that only authorized users could modify or create objects in specific schemas.
• Separation of roles (e.g., read-only, data entry):
- Implementing a separation of roles would have ensured that developers like Adil had limited access to production data, such as read-only access or data entry permissions, preventing them from making destructive changes.
• Use of views to hide sensitive columns :
- Using views to hide sensitive columns would have prevented Adil from accessing or sharing sensitive salary information, ensuring that only authorized users could view or modify such data.
• Audit logs or restricted role creation :
- Implementing audit logs or restricting role creation would have allowed the database administrator to monitor and control who can create new logins and roles, preventing unauthorized access to sensitive data.
• Environment separation (dev vs prod) :
- Implementing environment separation would have ensured that developers like Adil could only access test databases for development purposes, preventing accidental changes to production data.


### 4. Lessons Learned 
• What should developers have access to? 
- Developers should have access to development and test environments only, with limited permissions that prevent them from making changes to production data. They should be able to perform tasks such as writing and testing code, but not have the ability to delete or modify critical data in production.
• What should be restricted to DBAs or admins? 
- Database administrators (DBAs) or admins should have exclusive access to production databases, including the ability to create and manage logins, roles, and permissions. They should also be responsible for implementing security measures, such as schema-level permissions and audit logs, to ensure data integrity and security.
• Why is "minimum privilege" important?
- The principle of "minimum privilege" is crucial because it limits the access and permissions granted to users based on their specific roles and responsibilities. This reduces the risk of accidental or malicious actions that could compromise data integrity, security, or confidentiality. By ensuring that users only have the permissions necessary to perform their tasks, organizations can better protect sensitive information and maintain a secure database environment.