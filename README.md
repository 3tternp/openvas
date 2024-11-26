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

__sudo systemctl restart postgresql__

Now you can run the script once again without any problem. 
