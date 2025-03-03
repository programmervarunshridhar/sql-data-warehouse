/*
Modification Log:
Date: March 3, 2025
Author: [Your Name or ID]
Script Purpose: The purpose of this script is to drop and recreate the YTDWB database, then create bronze, silver, and gold schemas within it.

Changes Made:
Database Dropping Logic:

Checked for the existence of the YTDWB database before attempting to drop it.
If the database exists, changed its mode to SINGLE_USER to ensure no other connections prevent the drop.
Used WITH ROLLBACK IMMEDIATE to forcibly terminate any active connections to the database and roll back any uncommitted transactions.
Database Recreation:

After dropping the database, a new YTDWB database is created.
Schema Creation:

Created the following schemas in the YTDWB database:
bronze
silver
gold
Expected Outcome:
The YTDWB database will be recreated if it existed prior to the script execution.
Three schemas (bronze, silver, gold) will be created within the YTDWB database, and they will be ready for use.
Future Enhancements/Notes:
Ensure appropriate permissions are assigned to users for each schema as needed.
Consider adding error handling to capture any issues during the process, especially when dropping and recreating the database.
*/
use master;

--Drop and recreate the 'YTDWB' database
IF exists (select 1 from sys.databases where name = 'YTDWB')
begin
	alter database YTDWB set single_user with rollback immediate;
	drop database YTDWB;
end;
go

create database YTDWB;
go

use YTDWB;
go

-- Create schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
