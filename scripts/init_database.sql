
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
