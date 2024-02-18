Create table Students (ST_ID Serial PRIMARY KEY, ST_NAME Varchar(100), ST_LAST Varchar (100) )



CREATE TABLE interests (
    student_id INTEGER REFERENCES Students(ST_ID),
    interest VARCHAR(255)
);

Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (1,'Ayyub','Mammadli')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (2,'Elmar','Mammadlaliyev')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (3,'Farhad','Khidirov')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (4,'Natiq','Aliyev')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (5,'Ruslan','Salmanov')

select * from Students

Insert into  interests (student_id, interest) Values (1,'Football')
Insert into  interests (student_id, interest) Values (1,'Basketball')
Insert into  interests (student_id, interest) Values (2,'Tennis')
Insert into  interests (student_id, interest) Values (3,'Chess')
Insert into  interests (student_id, interest) Values (2,'Tennis')
Insert into  interests (student_id, interest) Values (4,'Hockey')
Insert into  interests (student_id, interest) Values (5,'Music')
Insert into  interests (student_id, interest) Values (5,'Math')
Insert into  interests (student_id, interest) Values (2,'History')

select * from interests

-- Function for Migration
CREATE OR REPLACE FUNCTION perform_migration() RETURNS VOID AS $$
BEGIN
    -- Rename the STUDENTS.ST_ID to STUDENTS.STUDENT_ID
    ALTER TABLE STUDENTS RENAME COLUMN ST_ID TO STUDENT_ID;

    -- Change the length of STUDENTS.ST_NAME and STUDENTS.ST_LAST from 100 to 30
    ALTER TABLE STUDENTS 
        ALTER COLUMN ST_NAME TYPE VARCHAR(30),
        ALTER COLUMN ST_LAST TYPE VARCHAR(30);

    -- Aggregating interests into an array per student ID
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

    -- Recreate interests table with updated schema
    CREATE TABLE interests (
        student_id INTEGER REFERENCES Students(STUDENT_ID),
        interests VARCHAR[] -- Change the type to VARCHAR[]
    );

    -- Insert aggregated interests into the new interests table
    INSERT INTO interests (student_id, interests)
    SELECT student_id, aggregated_interests FROM temp_interests;

    -- Drop the temporary table
    DROP TABLE IF EXISTS temp_interests;
END;
$$ LANGUAGE plpgsql;




-- Execute Migration
SELECT perform_migration();



SELECT * FROM students;
SELECT * FROM interests;
	
	