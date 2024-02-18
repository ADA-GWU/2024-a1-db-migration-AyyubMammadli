
# 1. Instructions for running the code

## Required Installations 

    Download and Install PostgreSQL:
        You need to download and install PostgreSQL from https://www.postgresql.org/download/.
        During the installation process, you'll be prompted to set a password for the default postgres user and choose the port PostgreSQL will listen on (default is 5432).

     Download and Install pgAdmin4 :
        You need to download and install pgAdmin4, a management tool for PostgreSQL, from https://www.pgadmin.org/download/.

     Set Up pgAdmin4 :

        When you open pgAdmin4 for the first time, you'll be prompted to set up a master password for pgAdmin4.
        Provide the following details to set up a connection:
            Host: This is typically "localhost" if PostgreSQL is running on the same machine where pgAdmin4 is installed. If PostgreSQL is running on a different machine, you'll need to provide the IP address or hostname of that machine.
            Port: By default, PostgreSQL listens on port 5432. If you haven't changed this during installation, you can leave it as the default.
            Username: Enter the username you created during PostgreSQL setup. By default, this is often "postgres", but if you created a different user, use that username.
            Password: Enter the password associated with the username you provided.

## Creation and Insertion of Tables

Step1

After cloning the repository to your local machine you will receive 3 seperate files (excluding README.md) in one package. Firstly, you need to open your pgadmin4, and tap on the any server that you have on pgadmin4. After selecting server, it will request a password in order to connect to the database, and you will need to type the password that was initially set by you while opening pgadmin4 for the first time. 

Step2

After successfully connecting to the database, you will need to navigate to the desired database in pgAdmin4:

    Navigate to your Database:
        Go to Servers -> [Your connected server] -> Databases -> [Your database name]. By default, it is often named "postgres".

    Open Query Tool:
        Right-click on your database name and select "Query Tool" from the options provided. This will open an empty query tool.

Once you've followed these steps, you'll have the Query Tool open and ready to execute SQL commands within the context of your selected database.


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



# 2. Explanation of migration function



## Steps for Migration


1. **Backup Interests Table**: 
   - Run the following SQL command to create a backup of the interests table:
     ```sql
     CREATE TABLE interests_backup AS SELECT * FROM interests;
     ```

2. **Run Migration Function**:

   1.Create Backup Table:
        The interests_backup table is created by copying all the data from the interests table using the CREATE TABLE ... AS SELECT * FROM interests statement.

    2.Define Migration Function:
        The migration function is defined to carry out the migration process.

    3.Rename Columns in Students Table:
        The function begins by renaming the column ST_ID to STUDENT_ID in the STUDENTS table.

    4.Modify Column Data Types in Students Table:
        Next, it alters the data types of columns ST_NAME and ST_LAST in the STUDENTS table to VARCHAR(30).

    5.Create Temporary Table for Aggregated Interests:
        A temporary table named temp_interests is created to store aggregated interests data. This table stores each student's interests as an array.

    6.Drop Existing Interests Table:
        The existing interests table is dropped if it exists, using the DROP TABLE IF EXISTS interests statement.

    7.Create New Interests Table:
        A new interests table is created with columns student_id (referencing STUDENTS(STUDENT_ID)) and interests (an array of VARCHAR).

    8.Insert Aggregated Interests Data:
        Data from the temporary table temp_interests is inserted into the new interests table.

    9.Drop Temporary Table:
        The temporary table temp_interests is dropped to clean up.

    10.Execute the Migration Function:
        The migration function is executed using SELECT migration();.

    11.Verify Results:
        Finally, two SELECT statements are used to verify the changes:
            SELECT * FROM students retrieves all records from the students table.
            SELECT * FROM interests retrieves all records from the interests table.



# 2. Explanation of rollback function

## Steps for Rollback 

    1.Rename Columns in Students Table:
        The function begins by renaming the column STUDENT_ID to ST_ID in the Students table.

    2.Modify Column Data Types in Students Table:
        Next, it alters the data types of columns ST_NAME and ST_LAST in the Students table to VARCHAR(100).

    3.Rename Column and Modify Data Type in Interests Table:
        The function renames the column interests to interest in the interests table.
        It also changes the data type of the interest column to VARCHAR[] (an array of VARCHAR).

    4.Delete All Records from Interests Table:
        All records from the interests table are deleted using the DELETE FROM statement.

    5.Restore Data from Backup:
        Data from a backup table named interests_backup is inserted into the interests table. Each interest value is inserted as an element of an array.
        The interests_backup table is dropped afterward to clean up.

    6.Execute the Rollback Function:
        After defining the function, it is executed by selecting it with SELECT rollback_function();.

    7.Verify Results:
        Finally, two SELECT statements are used to verify the changes:
            SELECT * FROM students retrieves all records from the students table.
            SELECT * FROM interests retrieves all records from the interests table.











