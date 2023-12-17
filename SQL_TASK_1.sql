--CREATE TABLE Groups(
--[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--[Name] NVARCHAR(10) NOT NULL,
--[Rating] INT NOT NULL,
--[Year] INT NOT NULL,
--CHECK([Name]!=''),
--CHECK([Rating] > 0 AND [Rating] < 5),
--CHECK([Year] > 0 AND [Year] < 5)
--)

--CREATE TABLE Chairs(
--[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--[Financing] MONEY NOT NULL DEFAULT(0), 
--[Name] NVARCHAR(100) NOT NULL UNIQUE,
--CHECK([Name] != ''),
--CHECK([Financing] >= 0)
--)

CREATE TABLE Faculties(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(100) UNIQUE NOT NULL,
CHECK([Name] != '')
)

CREATE TABLE Teachers(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[EmploymentDate] DATE NOT NULL,
[Name] NVARCHAR(MAX) NOT NULL,
[Premium] MONEY NOT NULL DEFAULT(0),
[Salary] MONEY NOT NULL,
[Surname] NVARCHAR(MAX) NOT NULL,
CHECK([Surname] != ''),
CHECK([Salary] > 0),
CHECK([Premium] >= 0),
CHECK([Name] != ''),
CHECK([EmploymentDate] >= '1990-01-01')
)