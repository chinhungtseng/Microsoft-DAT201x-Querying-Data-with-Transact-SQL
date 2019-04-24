-- Question 1
-- Use CHOOSE() and MONTH() to get the season in which each order was shipped from the Orders table.
-- You should select the order ID, shipped date, and then the season aliased as ShippedSeason. 
-- You can copy and paste the below into your query.
-- 'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 'Summer', 'Summer', 'Summer', 'Autumn', 'Autumn', 'Autumn', 'Winter'
-- Be careful to filter out any NULL shipped dates.
SELECT OrderId, ShippedDate, CHOOSE(MONTH(ShippedDate), 'Winter', 'Winter', 'Spring', 
                                                        'Spring', 'Spring', 'Summer', 
                                                        'Summer', 'Summer', 'Autumn', 
                                                        'Autumn', 'Autumn', 'Winter')
FROM dbo.Orders
WHERE ShippedDate IS NOT NULL;

-- Question 2
-- Using the Suppliers table, select the company name and use a simple IIF expression to display 'outdated' if a company has a fax number, 
-- or 'modern' if it doesn't. Alias the result of the IIF expression to Status.
SELECT CompanyName, IIF(Fax IS NULL, 'modern', 'outdated')
FROM dbo.Suppliers;

-- Question 3
-- Select from the Customers, Orders, and Order Details tables. Note that you need to use [Order Details] since the table name contains whitespace.
-- Use GROUP BY and ROLLUP() to get the total quantity ordered by all countries, while maintaining the total per country in your result set.
-- Your first column should be the country, and the second column the total quantity ordered by that country, aliased as TotalQuantity.
SELECT C.Country, SUM(OD.Quantity) AS TotalQuantity
FROM dbo.Customers AS C
JOIN dbo.Orders AS O
ON C.CustomerID = O.CustomerID
JOIN dbo.[Order Details] AS OD
ON O.OrderID = OD.OrderID
GROUP BY ROLLUP(C.Country);

-- Question 4
-- From the Customers table, use GROUP BY to select the country, contact title, 
-- and count of that contact title aliased as Count, grouped by country and contact title (in that order).
-- Then use CASE WHEN, GROUPING_ID(), and ROLLUP() to add a column called Legend, which shows one of two things:
-- 1. When the GROUPING_ID is 0, show '' (i.e., nothing)
-- 2. When the GROUPING_ID is 1, show Subtotal for << Country >>'
-- Do not use ORDER BY to order your results.
SELECT Country, ContactTitle, COUNT(ContactTitle) AS Count,
       CASE
         WHEN GROUPING_ID(Country, ContactTitle) = 0 THEN ''
         ELSE
         'Subtotal for ' + Country
       END AS Legend
FROM Customers
GROUP BY ROLLUP(Country, ContactTitle);

-- Question 5
-- Convert the following query to be pivoted, using PIVOT().
-- SELECT CategoryID, AVG(UnitPrice)
-- FROM Products
-- GROUP BY CategoryID;
-- Your result set should look like this:
-- Per Category	      1	      2	      3	      4	      5      	6	      7	      8
-- Average Unit Price	37.9791	23.0625	25.1600	28.7300	20.2500	54.0066	32.3700	20.6825
SELECT 'Average Unit Price' AS 'Per Category', [1], [2], [3], [4], [5], [6], [7], [8]
FROM (SELECT CategoryID , UnitPrice FROM Products) AS SourceTable
PIVOT (AVG(UnitPrice) FOR CategoryID IN ([1], [2], [3], [4], [5], [6], [7], [8])) AS PivotTable;

-- Question 6
-- Insert into the Region table the region ID 5 and the description 'Space'.
-- Then, in a second query, select the newly inserted data from the table using a WHERE clause.
-- Note: When you execute a query and the result is fetched, the database will be rolled back to its initial state. 
-- This means that you can click "Run Code" repeatedly, starting with a clean slate every time.
INSERT INTO Region
VALUES (5, 'Space');

SELECT * FROM Region
WHERE RegionDescription = 'Space';

-- Question 7
-- Update the region descriptions in the Region table to be all uppercase, using SET and UPPER().
-- Next, select all data from the table to view your updates.
-- Note: When you execute a query and the result is fetched, the database will be rolled back to its initial state.
-- This means that you can click "Run Code" repeatedly, starting with a clean slate every time.
UPDATE Region
SET RegionDescription = UPPER(RegionDescription);

SELECT * FROM Region;

-- Question 8
-- Write a script that safely checks whether a certain region exists:
-- 1. Declare a custom region @region called 'Space', of type NVARCHAR(25). Use IF NOT EXISTS, ELSE, and BEGIN..END to:
-- 2. throw an error with THROW 50001, 'Error!', 0 if no record whose RegionDescription matches @region exists.
-- 3. select all columns for that region from the Region table if the record does exist.
-- Notes:
-- 1. Specify the Region table as Region, not dbo.Region.
-- 2. Use SELECT * FROM Region <fill in> everywhere.
DECLARE @region NVARCHAR(25) = 'Space';

IF NOT EXISTS (SELECT * FROM Region WHERE RegionDescription = @region)
BEGIN
  THROW 50001, 'Error!', 0;
END
ELSE
BEGIN
  SELECT * FROM Region;
END;
-- This my solution, but I don't know why my submission is incorrect...