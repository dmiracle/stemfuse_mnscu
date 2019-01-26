-- courses_db database
DROP DATABASE IF EXISTS courses_db;
CREATE DATABASE courses_db;
USE courses_db;  

CREATE TABLE courses(
   starId 		INT PRIMARY KEY NOT NULL AUTO_INCREMENT ,
   courseId 	VARCHAR(255) NOT NULL,
   courseName	CHAR(20) NOT NULL,
   courseFee	REAL NOT NULL,
   maximumLimit INT	NOT NULL,
   enrollment   BOOLEAN
);

INSERT INTO courses VALUES
(1, 'CHE-100','Intro to Chemstry', 555.55, 25, True),
(2, 'ICS-140','Programming 1', 888.99, 30,	True), 
(3, 'ICS-141','Programming 2', 999.99, 25,	True), 
(4, 'ICS-240','Programming 3', 1200.00, 20,True), 
(5, 'Bio-100','Intro to Biology', 544.99, 5, True),
(6, 'CFS-100','Intro to FS', 1300.0, 25, True);

CREATE TABLE students (
    studentID int NOT NULL,
    firstName CHAR(9) NOT NULL,
	lastName CHAR(9) NOT NULL,
    starId int,
    PRIMARY KEY (studentID),
    FOREIGN KEY (starId) REFERENCES courses(starId)
);

INSERT INTO students VALUES
('1001',	'Sara',	'Johnson', 1),
('1002',	'John',	'Mike', 2), 
('1003',	'Alex',	'Adam', 3),
('1004',	'Moha',	'Abdi', 4),
('1005',	'Martha',	'Alex', 5);
--join -- 

UPDATE courses
SET courseId = 1, courseName = 'Cyber', courseFee = 1200, maximumLimit = 6, enrollment = False
WHERE courseId = 1;

DELETE FROM courses
WHERE courseID = 2;

SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;


GRANT INSERT
ON *
TO admin@localhost
IDENTIFIED BY 'pass1234';

-- JOIN --
SELECT *
FROM   courses c
JOIN   students s ON c.starId = s.starId;

--INNER JOIN--
SELECT *
FROM courses
INNER JOIN students ON courses.starId = students.starId; 

--inner JOIN--
SELECT *
FROM courses
LEFT JOIN students ON courses.starId = students.starId;

--RIGHT JOIN--
SELECT *
FROM courses
RIGHT JOIN students ON courses.starId = students.starId;

--FULL OUTER JOIN(UNION)--
SELECT * FROM students
LEFT JOIN courses ON students.starId = courses.starId
UNION
SELECT * FROM courses
RIGHT JOIN students ON courses.starId = students.starId;

--Create View --
CREATE VIEW ics240_view AS
SELECT *
FROM courses
WHERE courses.courseID = 'ICS-240';
SELECT * FROM ics240_view;

--LEFT JOIN--
SELECT *
FROM courses
RIGHT JOIN students ON courses.starId = students.starId;
