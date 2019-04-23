-- Question 1
-- Get the order ID and unit price for each order by joining the Orders table and the Order Details table.
-- Note that you need to use [Order Details] since the table name contains whitespace.
SELECT O.OrderID, OD.UnitPrice
FROM dbo.[Order Details] AS OD
JOIN dbo.Orders AS O
ON OD.OrderID = O.OrderID

-- Question 2
-- Get the order ID and first name of the associated employee by joining the Orders and Employees tables.
SELECT O.OrderID, E.FirstName
FROM dbo.Orders AS O
JOIN dbo.Employees AS E
ON O.EmployeeID = E.EmployeeID

-- Question 3
-- Get the employee ID and related territory description for each territory an employee is in, by joining the Employees, 
-- EmployeeTerritories and Territories tables.
SELECT E.EmployeeID, T.TerritoryDescription
FROM dbo.Employees AS E
JOIN dbo.EmployeeTerritories AS ET
ON E.EmployeeID = ET.EmployeeID
JOIN dbo.Territories AS T
ON ET.TerritoryID = T.TerritoryID

-- Question 4
-- Select all the different countries from the Customers table and the Suppliers table using UNION.
SELECT Country
FROM dbo.Suppliers
UNION
SELECT Country
FROM dbo.Customers

-- Question 5
-- Select all the countries, including duplicates, from the Customers table and the Suppliers table using UNION ALL.
SELECT Country
FROM dbo.Suppliers
UNION ALL
SELECT Country
FROM dbo.Customers

-- Question 6
-- Using the Products table, get the unit price of each product, rounded to the nearest dollar.
SELECT ROUND(UnitPrice,0) AS UnitPrice
FROM dbo.Products

-- Question 7
-- Using the Products table, get the total number of units in stock across all products.
SELECT SUM(UnitsInStock)
FROM dbo.Products

-- Question 8
-- Using the Orders table, get the order ID and year of the order by using YEAR(). Alias the year as OrderYear.
SELECT OrderID, YEAR(OrderDate) AS OrderYear
FROM dbo.Orders

-- Question 9
-- Using the Orders table, get the order ID and month of the order by using DATENAME(). Alias the month as OrderMonth.
SELECT OrderID, DATENAME(mm, OrderDate) AS OrderMonth
FROM dbo.Orders

-- Question 10
-- Use LEFT() to get the first two letters of each region description from the Region table.
SELECT LEFT(RegionDescription, 2)
FROM dbo.Region

-- Question 11
-- Using the Suppliers table, select the city and postal code for each supplier, 
-- using WHERE and ISNUMERIC() to select only those postal codes which have no letters in them.
SELECT City, PostalCode
FROM dbo.Suppliers
WHERE ISNUMERIC(PostalCode) = 1

-- Question 12
-- Use LEFT() and UPPER() to get the first letter (capitalized) of each region description from the Region table.
SELECT UPPER(LEFT(RegionDescription, 1))
FROM dbo.Region
