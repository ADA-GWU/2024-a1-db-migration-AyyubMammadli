CREATE OR REPLACE FUNCTION create_and_insert() RETURNS VOID AS $$
BEGIN
    CREATE TABLE IF NOT EXISTS Students (
        ST_ID Serial PRIMARY KEY,
        ST_NAME Varchar(100),
        ST_LAST Varchar(100)
    );

    CREATE TABLE IF NOT EXISTS interests (
        student_id INTEGER REFERENCES Students(ST_ID),
        interest VARCHAR(255)
    );

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
		
END;
$$ LANGUAGE plpgsql;


SELECT create_and_insert();

SELECT * FROM STUDENTS
SELECT * FROM INTERESTS