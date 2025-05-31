 # Understanding SQL Security Levels and Real-World Risks 
 ## 1. What are SQL Security Levels? 
 SQL Security Levels refer to the different layers of security that can be applied to a SQL Server instance, databases, and their objects. These levels help in managing access control and ensuring that only authorized users can perform specific actions within the SQL Server environment. The main security levels include:

• Server-level login :

A server-level login is a user account that allows access to the SQL Server instance itself. It is created at the server level and can be used to connect to the SQL Server, granting permissions to manage the server and its databases.

• Database-level user :

A database-level user is an account that exists within a specific database. It is created based on a server-level login and can be granted permissions to perform actions within that particular database, such as reading or writing data.

• Schema-level permissions:

A schema-level permission is a set of rights granted to a user or role that allows them to perform actions on objects within a specific schema in a database. Schemas are containers for database objects, and permissions can be granted at the schema level to control access to all objects within that schema.

• Object-level permissions (mention only briefly):

Object-level permissions are specific rights granted to a user or role to perform actions on individual database objects, such as tables, views, or stored procedures. These permissions can be more granular than schema-level permissions and allow for fine-tuned control over access to specific objects.
