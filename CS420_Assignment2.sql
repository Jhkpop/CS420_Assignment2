/*
This database Schema, data insertion, data update/deletion, and view script is for CS420 assignment 2.
I'm going to have some fun with this.
*/
-- Creation of the tables.

CREATE TABLE Student(
studentID int primary key,
FName varchar(50),
LName varchar(50),
major varchar(50),
Academic_year int
);

CREATE TABLE Instructor(
InstructorID int primary key,
Name varchar(50),
Department varchar(50)
);

CREATE TABLE Course(
CourseID int primary key,
CourseTitle varchar(50),
InstructorID int,
CONSTRAINT Instructor_ID FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Enrollment(
EnrollmentID int primary key,
StudentID int,
CONSTRAINT Student_ID FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
CourseID int, 
CONSTRAINT Course_ID FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
Grade int
);

DROP TABLE Enrollment;

SHOW TABLES;
DESCRIBE Student;
DESCRIBE Instructor;
DESCRIBE Course;
DESCRIBE Enrollment;

-- Inserting data into each table.
INSERT INTO Student(studentID, FName, LName, major, Academic_year)
VALUES (1, "Mark", "Grayson", "Fighting villains", 2), 		-- If you haven't seen Invincible, I couldn't recommend it more.
		(2, "James", "Jameson", "Journalism", 4),
        (3, "Peter", "Parker", "Biophysics", 1),
        (4, "Jane", "Doe", "Mathematics", 4),
        (5, "Mary", "Jane", "Botany", 3);
        
INSERT INTO Instructor(InstructorID, Name, Department) -- CWU professors are making an appearance.
VALUES (1000, "Davendra", "Journalism"),
		(1001, "Zhu", "Crime Fighting"),
        (1002, "Klieve", "Mathematics");

INSERT INTO Course(CourseID, CourseTitle, InstructorID) -- I've inserted the foreign key (InstructorID) directly.
VALUES (2000, "Busting Criminals 101", 1000), 
		(2001, "Swinging Physics", 1002),
        (2002, "Researching a Topic", 1000),
        (2003, "Following a Lead", 1000);

INSERT INTO Enrollment(EnrollmentID, StudentID, CourseID, Grade)	-- Adding foreign keys through a subquery.
VALUES (3000, (SELECT StudentID FROM Student WHERE StudentID = 1), (SELECT CourseID FROM Course WHERE CourseID = 2000),  91),
		(3001,(SELECT StudentID FROM Student WHERE StudentID = 4), (SELECT CourseID FROM Course WHERE CourseID = 2001), 82),
        (3002, (SELECT StudentID FROM Student WHERE StudentID = 4), (SELECT CourseID FROM Course WHERE CourseID = 2003),93),
        (3003, (SELECT StudentID FROM Student WHERE StudentID = 2), (SELECT CourseID FROM Course WHERE CourseID = 2002),75),
        (3004, (SELECT StudentID FROM Student WHERE StudentID = 3), (SELECT CourseID FROM Course WHERE CourseID = 2001), 100),
        (3005, (SELECT StudentID FROM Student WHERE StudentID = 5), (SELECT CourseID FROM Course WHERE CourseID = 2000),43);
        
        
SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;
-- Updating and deleting operations.

-- Retrieval and JOIN queries.