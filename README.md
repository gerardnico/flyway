# flyway
A flyway demo/sample repository to be able to start rapidly a [flyway](https://flywaydb.org/) project.

This project has:

  * a wrapper dos script around the `flyway` command called [fly.cmd](fly.cmd)
  * the [sql subdirectory](./sql) where the SQL file must be located 
  * one sample SQL file called [V1__first.sql](./sql/V1__first.sql) 

## Steps

  * Install Flyway and add the install directory in the PATH environment variable
  * The `--help` option should work for the `flyway` command
```bash  
flyway --help
```
  * Add the current directory to the `PATH` environment variable of your OS to be able to call the flyway wrapper script [fly](fly.cmd)
  * FYI: The [fly.cmd](fly.cmd) gives through the option `-locations=filesystem:%cd%\sql` a relative location of the SQL file which is the sub-directory [sql](./sql)
  * The `--help` option should work for the [fly](fly.cmd) command 
```bash  
fly --help
``` 
  * Change the following properties values of the [flyway.conf](flyway.conf) file to be able to connect to your database
```ini
flyway.url=jdbc:sqlserver://docker-host:1433
flyway.user=sa
flyway.password=TheSecret1!
```
  * Drop all object database if the schema is not empty
```bash  
fly clean
```
  * Apply the SQL located in the [sql sub-directory](./sql)
```bash  
fly migrate
``` 
Output:
```txt
Flyway Community Edition 5.1.3 by Boxfuse

Database: jdbc:sqlserver://docker-host:1433;sslProtocol=TLS;jaasConfigurationName=SQLJDBCDriver;statementPoolingCacheSize=0;serverPreparedStatementDiscardThreshold=10;enablePrepareOnFirstPreparedStatementCall=false;fips=false;socketTimeout=0;authentication=NotSpecified;authenticationScheme=nativeAuthentication;xopenStates=false;sendTimeAsDatetime=true;trustStoreType=JKS;trustServerCertificate=false;TransparentNetworkIPResolution=true;serverNameAsACE=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;queryTimeout=-1;packetSize=8000;multiSubnetFailover=false;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;columnEncryptionSetting=Disabled;applicationName=Microsoft JDBC Driver for SQL Server;applicationIntent=readwrite; (Microsoft SQL Server 14.0)
Successfully validated 1 migration (execution time 00:00.033s)
Current version of schema [dbo]: << Empty Schema >>
Migrating schema [dbo] to version 1 - first
Successfully applied 1 migration to schema [dbo] (execution time 00:00.108s)
```
  * Info
```bash  
fly info
```
```txt
+-----------+---------+-------------+------+---------------------+---------+
| Category  | Version | Description | Type | Installed On        | State   |
+-----------+---------+-------------+------+---------------------+---------+
| Versioned | 1       | first       | SQL  | 2018-12-11 16:34:43 | Success |
+-----------+---------+-------------+------+---------------------+---------+
```
