CREATE DATABASE Academy_DB
GO
USE Academy_DB
GO

CREATE TABLE Faculties(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Dean] NVARCHAR(MAX) CHECK([Dean] != ''),
[Name] NVARCHAR(100) UNIQUE NOT NULL CHECK([Name] != ''),
)

CREATE TABLE Departments(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Financing] MONEY NOT NULL DEFAULT(0) CHECK([Financing] > 0),
[Name] NVARCHAR(100) UNIQUE NOT NULL CHECK([Name] != '')
)

CREATE TABLE Groups(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(10) UNIQUE NOT NULL CHECK([Name] != ''),
[Rating] INT NOT NULL CHECK([Rating] >= 0 AND [Rating] <= 5),
[YEAR] INT NOT NULL CHECK([Year] >= 1 AND [Year] <= 5)
)

CREATE TABLE Teachers(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[EmploymentDate] DATE DEFAULT('01-01-1990') NOT NULL,
[IsAssistant] BIT DEFAULT(0) NOT NULL,
[IsProfessor] BIT DEFAULT(0) NOT NULL,
[Name] NVARCHAR(MAX) CHECK([Name] != '') NOT NULL,
[Position] NVARCHAR(MAX) CHECK([Position] != '') NOT NULL,
[Premium] MONEY DEFAULT(0) CHECK([Premium] >= 0) NOT NULL,
[Salary] MONEY CHECK([Salary] > 0) NOT NULL,
[Surname] NVARCHAR(MAX) CHECK([Surname] != '') NOT NULL
)


INSERT INTO Departments ([Financing], [Name])
VALUES
(12000, 'Chemistry Department'),
(18000, 'Physics Department'),
(22000, 'Software Development Department'),
(15000, 'Biology Department'),
(20000, 'Electrical Engineering Department'),
(25000, 'Civil Engineering Department'),
(17000, 'History Department'),
(19000, 'Psychology Department'),
(21000, 'Economics Department'),
(23000, 'Political Science Department');

INSERT INTO Faculties ([Dean], [Name])
VALUES
('Prof. Sarah White', 'Faculty of Science'),
('Prof. Michael Black', 'Faculty of Law'),
('Prof. Emily Green', 'Faculty of Social Sciences'),
('Prof. Robert Blue', 'Faculty of Medicine'),
('Prof. Olivia Yellow', 'Faculty of Business'),
('Prof. Ethan Red', 'Faculty of Arts'),
('Prof. Sophia Orange', 'Faculty of Education'),
('Prof. Jackson Violet', 'Faculty of Agriculture'),
('Prof. Lily Green', 'Faculty of Architecture'),
('Prof. Aiden Brown', 'Faculty of Information Technology');

INSERT INTO Groups ([Name], [Rating], [Year])
VALUES
('Group F', 2, 5),
('Group G', 4, 5),
('Group H', 3, 4),
('Group I', 1, 3),
('Group J', 5, 5),
('Group K', 4, 3),
('Group L', 2, 4),
('Group M', 3, 2),
('Group N', 5, 5),
('Group O', 1, 1);

INSERT INTO Teachers ([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname])
VALUES
('1990-05-20', 1, 0, 'Diana', 'Assistant Professor', 450, 5000, 'Taylor'),
('1999-11-08', 0, 1, 'Ethan', 'Professor', 1000, 12000, 'Williams'),
('1995-09-18', 1, 0, 'Fiona', 'Assistant Professor', 600, 7000, 'Miller'),
('2002-02-28', 0, 0, 'George', 'Lecturer', 800, 9000, 'Martin'),
('1997-07-15', 1, 1, 'Henry', 'Professor', 1200, 15000, 'Anderson'),
('2005-01-10', 0, 0, 'Isabel', 'Lecturer', 700, 8000, 'Wilson'),
('1993-03-05', 1, 0, 'Jack', 'Assistant Professor', 500, 6000, 'Harrison'),
('2000-09-22', 0, 1, 'Katherine', 'Professor', 1100, 13000, 'White'),
('1998-12-01', 1, 0, 'Liam', 'Assistant Professor', 550, 6500, 'Smith'),
('2003-06-12', 0, 0, 'Mia', 'Lecturer', 750, 9500, 'Davis');


--	Print departments table but arrange its fields in the reverse order.
SELECT * FROM Departments
ORDER BY [Id] DESC


--Print group names and their ratings using “Group Name” and “Group Rating”, respectively, as names of the fields.SELECT [Name] AS [Group Name], [Rating] AS [Group Rating]FROM GroupsSELECT [Surname], (Salary / Premium) * 100FROM Teachers--Print the faculty table as a single field in the following format:
--"The dean of faculty [faculty] is [dean]"
SELECT 'The dean of faculty ' + [Name] + ' is ' + [Dean]
FROM Faculties

--Identify names of the teachers who are professors and whose
--wage rate exceeds 1050
SELECT [Name] 
FROM Teachers
WHERE IsProfessor = 1 AND Salary > 1050;


--Print names of the departments whose funding is less than
--11,000 or more than 25,000.

SELECT [Name]
FROM Departments
WHERE Financing NOT BETWEEN 11000 AND 25000

--Print names of faculties other than Computer Science.
SELECT Name
FROM Faculties
WHERE [Name] <> 'Computer Science'

--Print names and positions of teachers who are not professors.

SELECT [Name], [Position]
FROM Teachers
WHERE IsProfessor = 0;


--Print surnames, positions, wage rates, and premia of assistants
--whose premium is in the range from 160 to 550. 

SELECT [Surname], [Position], [Salary], [Premium]
FROM Teachers
WHERE Premium BETWEEN 160 AND 550;


--Print surnames and wage rates of assistants.
SELECT [Surname], [Salary]
FROM Teachers
WHERE IsAssistant = 1

--Print surnames and positions of the teachers who were hired
--before 01.01.2000. 

SELECT [Surname], [Position]
FROM Teachers
WHERE EmploymentDate < '01-01-2000'

--Print names of the departments in alphabetical order up
--to  the  Software Development Department. The output field
--should be named "Name of Department"

SELECT [Name] AS [Name of Department]
FROM Departments
WHERE Name <= 'Software Development Department'
ORDER BY [Name] 

--Print names of the assistants whose salary (amount of wage
--rate and premium) is not more than 1200.

SELECT [Name]
FROM Teachers
WHERE [Salary] + [Premium] > 1200 AND IsAssistant = 1;

--Print names of groups of the 5th year whose rating is in the range
--from 2 to 4.

SELECT [Name]
FROM Groups
WHERE [Year] = 5 AND [Rating] BETWEEN 2 AND 4;

--Print names of assistants whose wage rate is less than 550 or
--premium is less than 200.SELECT [Name]FROM TeachersWHERE [Salary] < 550 OR [Premium] < 200;