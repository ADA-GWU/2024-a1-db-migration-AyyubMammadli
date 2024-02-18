CREATE TABLE interests_backup AS
SELECT * FROM interests;

CREATE OR REPLACE FUNCTION migration() RETURNS VOID AS $$
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

SELECT migration();

Select * from students
Select * from interests

