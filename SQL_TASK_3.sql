--1. Get empid, firstname, lastname, country, region, city of all employees from USA
SELECT FirstName, LastName, CountryRegionName, City
FROM Employees

--Get the number of employees for each specialty.
SELECT JobTitle, COUNT(JobTitle)
FROM Employees
GROUP BY JobTitle

--Count the number of people for each name
SELECT FirstName, COUNT(FirstName)
FROM Employees
GROUP BY FirstName

--Get the most common name. 
SELECT TOP(1) FirstName, COUNT(FirstName)
FROM Employees
GROUP BY FirstName
ORDER BY COUNT(FirstName) DESC


--Get the least common name
SELECT TOP(1) FirstName, COUNT(FirstName)
FROM Employees
GROUP BY FirstName
ORDER BY FirstName DESC

--Get the top 5 cities where the most workers are. 
SELECT TOP(5) City, COUNT(City)
FROM Employees
GROUP BY City
ORDER BY COUNT(City) DESC


--Get the top 5 cities, which have the most unique specialties. 
SELECT City, COUNT(DISTINCT JobTitle) AS UniqueSpecialtiesCount
FROM Employees
GROUP BY City
ORDER BY UniqueSpecialtiesCount DESC

--Issue mailing addresses for emailing to all employees who started working on 1/01/2012. 
SELECT EmailAddress, StartDate
FROM Employees
WHERE StartDate > '2012-01-01'

--Issue statistics in what year how many employees were employed
SELECT YEAR(StartDate), Count(StartDate)
FROM Employees
GROUP BY StartDate

--Issue statistics in which year how many workers in which countries were employed.

SELECT YEAR(StartDate), CountryRegionName, COUNT(*) AS [EMPLOYEES COUNT]
FROM Employees
GROUP BY CountryRegionName, YEAR(StartDate)

--Refresh the Employees table by adding data from the History table to the EndDate column

--Issue statistics on how many employees in which year they left

--Issue the number of employees who have worked less than a year
