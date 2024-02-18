
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

## Description
This readme file provides instructions for migrating data in a PostgreSQL database using SQL commands.

## Steps for Migration
Follow these steps to migrate data in your PostgreSQL database:

1. **Backup Interests Table**: 
   - Run the following SQL command to create a backup of the interests table:
     ```sql
     CREATE TABLE interests_backup AS SELECT * FROM interests;
     ```

2. **Run Migration Function**:
   - Execute the migration function by running the following SQL command:
     ```sql
     CREATE OR REPLACE FUNCTION migration() RETURNS VOID AS $$
     BEGIN
         -- Rename column ST_ID to STUDENT_ID
         ALTER TABLE STUDENTS RENAME COLUMN ST_ID TO STUDENT_ID;
     
         -- Change data types of columns ST_NAME and ST_LAST to VARCHAR(30)
         ALTER TABLE STUDENTS 
             ALTER COLUMN ST_NAME TYPE VARCHAR(30),
             ALTER COLUMN ST_LAST TYPE VARCHAR(30);
     
         -- Create temporary table to aggregate interests
         CREATE TEMP TABLE temp_interests AS
         SELECT
             student_id,
             ARRAY_AGG(DISTINCT interest ORDER BY interest) AS aggregated_interests
         FROM
             interests
         GROUP BY
             student_id;
     
         -- Drop existing interests table
         DROP TABLE IF EXISTS interests;
     
         -- Create new interests table with updated structure
         CREATE TABLE interests (
             student_id INTEGER REFERENCES Students(STUDENT_ID),
             interests VARCHAR[] 
         );
     
         -- Insert aggregated interests data into the new interests table
         INSERT INTO interests (student_id, interests)
         SELECT student_id, aggregated_interests FROM temp_interests;
     
         -- Drop temporary table
         DROP TABLE IF EXISTS temp_interests;
     END;
     $$ LANGUAGE plpgsql;
     ```
   - Execute the migration function using:
     ```sql
     SELECT migration();
     ```

3. **Verify Data Migration**:
   - Check if the data migration was successful by executing the following SQL queries:
     ```sql
     SELECT * FROM students;
     SELECT * FROM interests;
     ```

## Note
Ensure that you have appropriate permissions and backup your data before performing any migration operations.



# 2. Explanation of rollback function

# Description
This readme file provides instructions for rolling back data changes in a PostgreSQL database using a rollback function.

## Steps for Rollback
Follow these steps to roll back data changes in your PostgreSQL database:

1. **Create Rollback Function**: 
   - Run the following SQL command to create a rollback function:
     ```sql
     CREATE OR REPLACE FUNCTION rollback_function() RETURNS VOID AS
     $$
     BEGIN
         -- Rename column STUDENT_ID to ST_ID in Students table
         ALTER TABLE Students RENAME COLUMN STUDENT_ID TO ST_ID;
     
         -- Change data types of columns ST_NAME and ST_LAST to VARCHAR(100) in Students table
         ALTER TABLE Students
             ALTER COLUMN ST_NAME TYPE VARCHAR(100),
             ALTER COLUMN ST_LAST TYPE VARCHAR(100);
     
         -- Rename column interests to interest in interests table
         ALTER TABLE interests RENAME COLUMN interests TO interest;
     
         -- Change data type of interest column to VARCHAR[] in interests table
         ALTER TABLE interests ALTER COLUMN interest SET DATA TYPE VARCHAR[];
     
         -- Delete all records from interests table
         DELETE FROM interests;
     
         -- Insert data from interests_backup table into interests table
         INSERT INTO interests (student_id, interest)
         SELECT student_id, ARRAY[interest] FROM interests_backup;
         
         -- Drop interests_backup table
         DROP TABLE IF EXISTS interests_backup;
     END;
     $$ LANGUAGE plpgsql;
     ```
     
2. **Execute Rollback Function**:
   - Execute the rollback function using the following SQL command:
     ```sql
     SELECT rollback_function();
     ```

3. **Verify Rollback**:
   - Check if the rollback was successful by executing the following SQL queries:
     ```sql
     SELECT * FROM students;
     SELECT * FROM interests;
     ```























