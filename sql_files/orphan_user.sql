#Orphan users are the users which are available in the database level but their mapped logins not available in the server level. Orphan users are created when a database is restored from backup from one server on another server.
#Command to map an orphaned user
#If parameter is Auto_Fix, database user is mapped with same named SQL Server login. It may also create login, if not present.
#If parameter is Report, it lists the orphaned users and their security identifiers (SID).
#If parameter is Update_One, it links the specified database user to an existing SQL Server login.
#--Command to generate list of orphaned users
USE adventureWorks
GO
sp_change_users_login @Action='Report'
GO
#--Command to map an orphaned user
USE AdventureWorks
GO
sp_change_users_login @Action='update_one', 
@UserNamePattern='TestUser1', 
@LoginName='TestUser1'
GO
#--Command to map an orphaned user
EXEC sp_change_users_login 'Auto_Fix', 'TestUser2'
GO
#--Command to map an orphaned user to a login that is not present but will be created

EXEC sp_change_users_login 'Auto_Fix', 'TestUser3', null,'pwd'
GO