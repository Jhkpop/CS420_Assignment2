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
CONSTRAINT Course_ID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

SHOW TABLES;

-- Inserting data into each table.

-- Updating and deleting operations.

-- Retrieval and JOIN queries.