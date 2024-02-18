CREATE OR REPLACE FUNCTION rollback_function() RETURNS VOID AS
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
    
    -- Drop the backup table
    DROP TABLE IF EXISTS interests_backup;
END;
$$ LANGUAGE plpgsql;


SELECT rollback_function();

Select * from students
Select * from interests
