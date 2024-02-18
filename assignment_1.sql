Create table Students (ST_ID Serial PRIMARY KEY, ST_NAME Varchar(100), ST_LAST Varchar (100) )

drop table students
drop table interests

CREATE TABLE interests (
    student_id INTEGER REFERENCES Students(ST_ID),
    interest VARCHAR(255)
);
ROLLBACK;
BEGIN;

-- Multiple INSERT statements here
INSERT INTO Students (ST_ID, ST_NAME, ST_LAST) VALUES 
    (1,'Ayyub','Mammadli'),
    (2,'Elmar','Mammadaliyev'),
    (3,'Farhad','Khidirov'),
    (4,'Natiq','Aliyev'),
    (5,'Ruslan','Salmanov');

INSERT INTO interests (student_id, interest) VALUES 
    (1,'Football'),
    (1,'Basketball'),
    (2,'Tennis'),
    (3,'Chess'),
    (2,'Tennis'),
    (4,'Hockey'),
    (5,'Music'),
    (5,'Math'),
    (2,'History');

COMMIT;

select * from interests;
select * from students;

CREATE TABLE interests_backup AS
SELECT * FROM interests;


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

CREATE OR REPLACE FUNCTION perform_rollback() RETURNS VOID AS
$$
BEGIN
    -- Rollback changes to STUDENTS table
    ALTER TABLE Students RENAME COLUMN STUDENT_ID TO ST_ID;
    ALTER TABLE Students
        ALTER COLUMN ST_NAME TYPE VARCHAR(100),
        ALTER COLUMN ST_LAST TYPE VARCHAR(100);

    -- Rollback changes to INTERESTS table
    ALTER TABLE interests RENAME COLUMN interests TO interest;
    ALTER TABLE interests ALTER COLUMN interest SET DATA TYPE VARCHAR[];

    -- Revert data in INTERESTS table
    DELETE FROM interests;

    -- Reinsert data from the backup table, converting VARCHAR to VARCHAR[]
    INSERT INTO interests (student_id, interest)
    SELECT student_id, ARRAY[interest] FROM interests_backup;
END;
$$ LANGUAGE plpgsql;




-- Execute Migration
SELECT perform_migration();
SELECT perform_rollback();


SELECT * FROM students;
SELECT * FROM interests;
	
	