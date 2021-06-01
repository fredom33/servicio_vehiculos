
IF NOT EXISTS
(
    SELECT *
    FROM sys.databases
    WHERE name = 'sistema_ventas'
)
    BEGIN
        RESTORE DATABASE [sistema_ventas] FROM DISK = N'/var/opt/mssql/backup/sistema_ventas.bak' WITH FILE = 1, MOVE N'sistema_ventas' TO N'/var/opt/mssql/data/sistema_ventas.mdf', MOVE N'sistema_ventas_log' TO N'/var/opt/mssql/data/sistema_ventas_log.ldf', NOUNLOAD, STATS = 5;
        ALTER DATABASE [sistema_ventas] SET RECOVERY FULL;
        BACKUP DATABASE [sistema_ventas] TO DISK = 'aw17.bak';
        ALTER AVAILABILITY GROUP Ag1 ADD DATABASE [sistema_ventas];
END;
