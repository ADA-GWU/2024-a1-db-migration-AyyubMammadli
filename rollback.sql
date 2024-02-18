CREATE OR REPLACE FUNCTION rollback_function() RETURNS VOID AS
$$
BEGIN
    ALTER TABLE Students RENAME COLUMN STUDENT_ID TO ST_ID;
    ALTER TABLE Students
        ALTER COLUMN ST_NAME TYPE VARCHAR(100),
        ALTER COLUMN ST_LAST TYPE VARCHAR(100);

    ALTER TABLE interests RENAME COLUMN interests TO interest;
    ALTER TABLE interests ALTER COLUMN interest SET DATA TYPE VARCHAR[];

    DELETE FROM interests;

    INSERT INTO interests (student_id, interest)
    SELECT student_id, ARRAY[interest] FROM interests_backup;
    
    DROP TABLE IF EXISTS interests_backup;
END;
$$ LANGUAGE plpgsql;


SELECT rollback_function();

Select * from students
Select * from interests
