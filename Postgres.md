# Backup database

## create a dump file using pg_dump that contains data to be loaded
 To back up an existing PostgreSQL database on-premises or in a VM, run the following command:

<code>pg_dump -Fc -v --host=<host> --username=<name> --dbname=<database name> -f <database>.dump</code>

 
## Restore the data into the target Azure Database for PostgreSQL using pg_restore
 After you've created the target database, you can use the pg_restore command and the -d, --dbname parameter to restore the data into the target database from the    dump file.

<code> pg_restore -v --no-owner --host=<server name> --port=<port> --username=<user-name> --dbname=<target database name> <database>.dump</code>

Including the --no-owner parameter causes all objects created during the restore to be owned by the user specified with --username. For more information, see the official PostgreSQL documentation on pg_restore.

