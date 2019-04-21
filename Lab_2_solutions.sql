-- Lab 2: Querying Tables with SELECT Solutions

-- Retrieving Transportation Report Data
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

-- Retrieving Transportation Report Data (2)
SELECT TOP 10 PERCENT Name
FROM SalesLT.Product
-- order by the weight in descending order
ORDER BY Weight DESC;

-- Retrieving Transportation Report Data (3)
SELECT Name
FROM SalesLT.Product
ORDER BY Weight DESC
-- offset 10 rows and get the next 100
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

-- Retrieving Product Data
-- select the Name, Color, and Size columns
SELECT Name, Color, Size
FROM SalesLT.Product
-- check ProductModelID is 1
WHERE ProductModelID = 1;

-- Retrieving Product Data (2)
-- select the ProductNumber and Name columns
SELECT ProductNumber, Name
FROM SalesLT.Product
-- check that Color is one of 'Black', 'Red' or 'White'
-- check that Size is one of 'S' or 'M'
WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S', 'M');

-- Retrieving Product Data (3)
-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
-- filter for product numbers beginning with BK- using LIKE
WHERE ProductNumber LIKE 'BK-%';

-- Retrieving Product Data (4)
-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
-- filter for ProductNumbers
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';


