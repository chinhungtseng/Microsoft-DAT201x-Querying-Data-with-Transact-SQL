-- Question 1
-- Select the quantity per unit for all products in the Products table.
SELECT QuantityPerUnit FROM dbo.Products

-- Question 2
-- Select the unique category IDs from the Products table.
SELECT DISTINCT CategoryID FROM dbo.Products

-- Question 3
-- Select the names of products from the Products table which have more than 20 units left in stock.
SELECT ProductName
FROM dbo.Products
WHERE UnitsInStock > 20

-- Question 4
-- Select the product ID, product name, and unit price of the 10 most expensive products from the Products table.
SELECT TOP 10 ProductID, ProductName, UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC

-- Question 5
-- Select the product ID, product name, and quantity per unit for all products in the Products table. 
-- Sort your results alphabetically by product name (where A comes first).
SELECT ProductID, ProductName, QuantityPerUnit
FROM dbo.Products
ORDER BY ProductName

-- Question 6
-- Select the product ID, product name, and unit price of all products in the Products table. 
-- Sort your results by number of units in stock, from greatest to least.
-- Skip the first 10 results and get the next 5 after that.
SELECT ProductID, ProductName, UnitPrice
FROM dbo.Products
ORDER BY UnitsInStock DESC OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;

-- Question 7
-- Use STR, CONVERT, and NVARCHAR(30) where appropriate to display the first name, 
-- employee ID and birthdate (as Unicode in ISO 8601 format) for each employee in the Employees table.
-- Each result should be a single string in the following format,
-- where each <<value>> is replaced by the appropriately converted value:
SELECT FirstName + ' has an EmployeeID of ' + 
       STR(EmployeeID, 1) + ' and was born ' + 
       CONVERT(NVARCHAR(30), BirthDate, 126)
FROM dbo.Employees;

-- Question 8
-- Select from the Orders table.
-- The first column of your result should be a single string in exactly the following format:
-- <<ShipName>> is from <<ShipCity or ShipRegion or ShipCountry>>
-- If there is no ShipCity, then you should select ShipRegion, and if there is no ShipRegion you should select ShipCountry.
SELECT ShipName + ' is from ' + ISNULL(ShipCity, ISNULL(ShipRegion, ShipCountry))
FROM dbo.Orders;

-- Question 9
-- Select the ship name and ship postal code from the Orders table. If the postal code is missing, display 'unknown'
SELECT ShipName, ISNULL(ShipPostalCode, 'unknown') AS ShipPostalCode
FROM dbo.Orders;

-- Question 10
-- Using the Suppliers table, select the company name, and use a simple CASE expression to display 'outdated' if the company has a fax number, 
-- or 'modern' if it doesn't. Do this by specifying IS NULL in your conditional statement.
-- Alias the result of the CASE expression to Status.
SELECT CompanyName, 
  CASE 
    WHEN Fax IS NULL THEN 'outdated'
    ELSE 'modern'
  END AS Status
FROM dbo.Suppliers;
-- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/case-transact-sql?view=sql-server-2017