-- Question 1
-- Use a subquery to get the product name and unit price of products from the Products table 
-- which have a unit price greater than the average unit price from the Order Details table.
-- Note that you need to use [Order Details] since the table name contains whitespace.
SELECT ProductName, UnitPrice 
FROM dbo.Products
WHERE UnitPrice > (SELECT AVG(UnitPrice)
                   FROM dbo.[Order Details]);

-- Question 2
-- Select from the Employees and Orders tables. 
-- Use a subquery to get the first name and employee ID for employees who were associated with orders which shipped from the USA.
SELECT EmployeeID, FirstName
FROM dbo.Employees
WHERE EmployeeID IN (SELECT EmployeeID
                    FROM dbo.Orders
                    WHERE ShipCountry = 'USA');

-- Question 3
-- 1. Use the # to create a new temporary table called ProductNames which has one field called ProductName (a VARCHAR of max length 40).
-- 2. Insert into this table the names of every product from the Products table. Note that there are two syntaxes for the INSERT INTO statement. 
--    Use the syntax that does not specify the column names since the table only has one field.
-- 3. Select all columns from the ProductNames table you created.
-- Note: you need to specify the Products table as Products, not dbo.Products.
CREATE TABLE #ProductNames
(ProductName VARCHAR(40));

INSERT INTO #ProductNames
SELECT ProductName FROM  Products;

SELECT * from #ProductNames;