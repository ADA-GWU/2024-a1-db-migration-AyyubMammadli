CREATE TABLE interests_backup AS
SELECT * FROM interests;

CREATE OR REPLACE FUNCTION migration() RETURNS VOID AS $$
BEGIN
    ALTER TABLE STUDENTS RENAME COLUMN ST_ID TO STUDENT_ID;

    ALTER TABLE STUDENTS 
        ALTER COLUMN ST_NAME TYPE VARCHAR(30),
        ALTER COLUMN ST_LAST TYPE VARCHAR(30);

    CREATE TEMP TABLE temp_interests AS
    SELECT
        student_id,
        ARRAY_AGG(DISTINCT interest ORDER BY interest) AS aggregated_interests
    FROM
        interests
    GROUP BY
        student_id;

    DROP TABLE IF EXISTS interests;

    CREATE TABLE interests (
        student_id INTEGER REFERENCES Students(STUDENT_ID),
        interests VARCHAR[] 
    );

    INSERT INTO interests (student_id, interests)
    SELECT student_id, aggregated_interests FROM temp_interests;

    DROP TABLE IF EXISTS temp_interests;
END;
$$ LANGUAGE plpgsql;

SELECT migration();

Select * from students
Select * from interests

