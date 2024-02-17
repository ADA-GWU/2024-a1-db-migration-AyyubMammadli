Create table Students (ST_ID Serial PRIMARY KEY, ST_NAME Varchar(100), ST_LAST Varchar (100) )
select * from Students

CREATE TABLE interests (
    student_id INTEGER REFERENCES Students(ST_ID),
    interest VARCHAR(255)
);

Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (1,'Ayyub','Mammadli')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (2,'Elmar','Mammadlaliyev')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (3,'Farhad','Khidirov')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (4,'Natiq','Aliyev')
Insert into  Students (ST_ID, ST_NAME, ST_LAST) Values (5,'Ruslan','Salmanov')


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

ALTER TABLE STUDENTS RENAME COLUMN ST_ID TO STUDENT_ID;

ALTER TABLE STUDENTS ALTER COLUMN ST_NAME TYPE VARCHAR(30)
ALTER TABLE STUDENTS ALTER COLUMN ST_LAST TYPE VARCHAR(30)
ALTER TABLE INTERESTS RENAME COLUMN INTEREST TO INTERESTS
ALTER TABLE interests ALTER COLUMN interests TYPE VARCHAR[] USING ARRAY[interests]::VARCHAR[]
SELECT 
    STUDENT_ID,
    ARRAY_TO_STRING(ARRAY_AGG(DISTINCT interests.interests ORDER BY interests), ', ') AS INTERESTS
FROM 
    interests
GROUP BY 
    STUDENT_ID
ORDER BY 
    STUDENT_ID;