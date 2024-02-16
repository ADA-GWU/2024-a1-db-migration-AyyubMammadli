Create table Students (ST_ID Serial PRIMARY KEY, ST_NAME Varchar(100), ST_LAST Varchar (100) )
select * from Students

CREATE TABLE interests (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES Students(ST_ID),
    interest VARCHAR(255)
);




