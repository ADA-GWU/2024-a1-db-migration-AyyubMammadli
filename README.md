
## Required Installations 

1. You need to download and install Postgresql from https://www.postgresql.org/download/

    * During the installation process, you'll be prompted to set a password for the default postgres user and choose the port PostgreSQL will listen on (default is 5432)

2. You need to download and install PgAdmin4 (management tool for postgresql) from https://www.pgadmin.org/download/
3. When you open pgAdmin4 for the first time, you'll be prompted to set up a master password for pgAdmin4.

       * Host: This is typically "localhost" if PostgreSQL is running on the same machine where pgAdmin4 is installed. If PostgreSQL is running on a different     machine, you'll need to provide the IP address or hostname of that machine.

       *  Port: By default, PostgreSQL listens on port 5432. If you haven't changed this during installation, you can leave it as the default.

       *  Username: Enter the username you created during PostgreSQL setup. By default, this is often "postgres", but if you created a different user, use that username.

       *  Password: Enter the password associated with the username you provided.

## Creation and Insertion of Tables

Step1

After cloning the repository to your local machine you will receive 3 seperate files (excluding README.md) in one package. Firstly, you need to open your pgadmin4, and tap on the any server that you have on pgadmin4. After selecting server, it will request a password in order to connect to the database, and you will need to type the password that was initially set by you while opening pgadmin4 for the first time. 

Step2

After succesfully connecting to the database, you will need to go to Servers-> Server that you are connected-> Database-> your database name (default postgres). Then you will need to right click on your database name and select Query Tool from the given options. You will see empty query tool. 

Step3

After opening empty Query tool you will need to firstly open the creation_and_insertion.sql file that is in the cloned package on your local machine. For doing that, you just need to click on the 'Open a File' button, which is located right above the empty query tool. You will see creation_insertion function on your query tool, which you need to execute in order to create table and insert data to it. 

Step4 

Firstly, you need to run the creation_insertion function on that query. For running that function you need to select the portion of that script which is between 1 and 36th line. After selecting you need to run it by clicking "Execute Script" button, or just clicking F5 button on your keyboard. 

The output will be: 

 "CREATE FUNCTION

Query returned successfully in 84 msec."

Secondly, you need to execute that function by selecting the script in 38th line, and clicking to "Execute Script" button. 

Lastly, you will need to execute 40th and 41st line seperately as you were doing execution in previous steps. As a result you will see students and interests table.

Students table: 

"st_id"	  "st_name"	  "st_last"

1	      "Ayyub"	   "Mammadli"

2	      "Elmar"	 "Mammadaliyev"

3	     "Farhad"	 "Khidirov"

4	     "Natiq"	 "Aliyev"

5	     "Ruslan"	 "Salmanov"

Interests Table: 

"student_id"	"interest"

1	            "Football"

1	            "Basketball"

2	             "Tennis"

3	             "Chess"

2	             "Tennis"

4	             "Hockey"

5	             "Music"

5	             "Math"

2	             "History"



## Performing Migration

Step 1

In order to perform migration firstly you need to open new empty query tool in pgadmin4. For doing that, you will need to right click on your database name and select Query Tool from the given options, again. You will see new empty query tool. 

Step 2

After opening empty Query tool you will need to open the migration.sql file that is in the cloned package on your local machine. For doing that, you just need to click on the 'Open a File' button, which is located right above the empty query tool. You will see migration function on your query tool, which you need to execute in order to create table and insert data to it. 

Step 3 

Firstly, you need to run the migration function on that query. For running that function you need to select the portion of that script which is between 1 and 40th line. After selecting you need to run it by clicking "Execute Script" button, or just clicking F5 button on your keyboard. 

The output will be: 

 "CREATE FUNCTION

Query returned successfully in 84 msec."

Secondly, you need to execute that function by selecting the script in 42nd line, and clicking to "Execute Script" button. 

Lastly, you will need to execute 44th and 45st line seperately as you were doing execution in previous steps. As a result you will see altered students and interests table.


 After performing migration, in students table ST_ID will change to STUDENT_ID, and length of ST_NAME and ST_LAST will change from 15 to 30

Students table: 

"student_id"	  "st_name"	  "st_last"

1	               "Ayyub"	   "Mammadli"

2	               "Elmar"	 "Mammadaliyev"

3	               "Farhad"	 "Khidirov"

4	               "Natiq"	 "Aliyev"

5	               "Ruslan"	 "Salmanov"


After performing migration, in the Interests table column interest will change to interests, and it will group and convert individual interests of each student into array of interests.

Interests table: 

"student_id"	"interests"

1	            "{Basketball,Football}"

2	            "{History,Tennis}"

3	            "{Chess}"

4	            "{Hockey}"

5	            "{Math,Music}"



## Performing Rollback 

Step 1

In order to perform rollback firstly you need to open new empty query tool in pgadmin4. For doing that, you will need to right click on your database name and select Query Tool from the given options, again. You will see new empty query tool. 

Step 2

After opening empty Query tool you will need to open the migration.sql file that is in the cloned package on your local machine. For doing that, you just need to click on the 'Open a File' button, which is located right above the empty query tool. You will see rollback function on your query tool, which you need to execute in order to create table and insert data to it. 

Step 3 

Firstly, you need to run the migration function on that query. For running that function you need to select the portion of that script which is between 1 and 24th line. After selecting you need to run it by clicking "Execute Script" button, or just clicking F5 button on your keyboard. 

The output will be: 

 "CREATE FUNCTION

Query returned successfully in 84 msec."

Secondly, you need to execute that function by selecting the script in 27th line, and clicking to "Execute Script" button. 

Lastly, you will need to execute 29th and 30st line seperately as you were doing execution in previous steps. As a result you will see students and interests table as they were before migration phase.

Students table: 

"st_id"	  "st_name"	  "st_last"

1	      "Ayyub"	   "Mammadli"

2	      "Elmar"	 "Mammadaliyev"

3	     "Farhad"	 "Khidirov"

4	     "Natiq"	 "Aliyev"

5	     "Ruslan"	 "Salmanov"

Interests Table: 

"student_id"	"interest"

1	            "Football"

1	            "Basketball"

2	             "Tennis"

3	             "Chess"

2	             "Tennis"

4	             "Hockey"

5	             "Music"

5	             "Math"

2	             "History"

























