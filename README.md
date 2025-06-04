# openvas

1. Open terminal and clone the repo to your system 

    **git clone https://github.com/3tternp/openvas**

2. change path to directory 

     cd openvas 

3. change execution permission to the file as 

    chmod +x openvas.sh 

4. now run the file as 

   sudo ./openvas.sh

if you have multiple version of postgresql then you will get below error for testing i have postgresql 14 and 15 in my system so i got an error as 

__[-] ERROR: The default PostgreSQL version (15) (16) is not 17 that is required by libgvmd__


__[-] ERROR: Use pg_upgradecluster to update your PostgreSQL cluster__

To fix this error just change the port number of postgresql 15,16 and 17 go to the file 
sudo gedit /etc/postgresql/17/main/postgresql.conf 

search for 5434 and change it to 5432 

and for postgresql 16 make changes as 

__sudo gedit /etc/postgresql/16/main/postgresql.conf__

search for 5432 and change it to 5433 

and for postgresql 15 make changes as 

__sudo gedit /etc/postgresql/15/main/postgresql.conf__
search for 543X and change it to 5435

and restart the postgresql server using following command 

**database "postgres" has a collation version mismatch**

if you see the above error run following command and inside postgres database run below command accordingly 

sudo -u postgres psql

WARNING:  database "postgres" has a collation version mismatch

DETAIL:  The database was created using collation version 2.40, but the operating system provides version 2.41.
HINT:  Rebuild all objects in this database that use the default collation and run ALTER DATABASE postgres REFRESH COLLATION VERSION, or build PostgreSQL with the right library version.
```
psql (17.5 (Debian 17.5-1))
Type "help" for help.

postgres=# ALTER DATABASE gvmd REFRESH COLLATION VERSION; 

NOTICE:  version has not changed

ALTER DATABASE

postgres=# ALTER DATABASE postgres REFRESH COLLATION VERSION;

NOTICE:  changing version from 2.40 to 2.41

ALTER DATABASE

postgres=# \q
```


__sudo systemctl restart postgresql__

Now you can run the script once again without any problem. 
