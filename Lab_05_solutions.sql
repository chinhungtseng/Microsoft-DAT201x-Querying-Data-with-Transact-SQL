-- Lab 5: Using Functions and Aggregating Data Solution

-- Retrieving Product Information
-- select ProductID and use the appropriate functions with the appropriate columns
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight
FROM SalesLT.Product;

-- Retrieving Product Information (2)
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
       -- get the year of the SellStartDate
       YEAR(SellStartDate) as SellStartYear,
       -- get the month datepart of the SellStartDate
       DATENAME(m, SellStartDate) as SellStartMonth
FROM SalesLT.Product;

-- Retrieving Product Information (3)
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
       YEAR(SellStartDate) as SellStartYear,
       DATENAME(m, SellStartDate) as SellStartMonth,
       -- use the appropriate function to extract substring from ProductNumber
       LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product;

-- Retrieving Product Information (4)
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
       YEAR(SellStartDate) as SellStartYear,
       DATENAME(m, SellStartDate) as SellStartMonth,
       LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product
-- filter for numeric product size data
WHERE ISNUMERIC(Size) = 1;

-- Ranking Customers By Revenue
-- select CompanyName and TotalDue columns
SELECT C.CompanyName, SOH.TotalDue AS Revenue,
       -- get ranking and order by appropriate column
       RANK() OVER (ORDER BY SOH.TotalDue DESC) AS RankByRevenue
FROM SalesLT.SalesOrderHeader AS SOH
-- use appropriate join on appropriate table
JOIN SalesLT.Customer AS C
ON SOH.CustomerID = C.CustomerID;

-- Aggregating Product Sales
-- select the Name column and use the appropriate function with the appropriate column
SELECT P.Name, SUM(SOD.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SOD
-- use the appropriate join
JOIN SalesLT.Product AS P
-- join based on ProductID
ON SOD.ProductID = P.ProductID
GROUP BY P.Name
ORDER BY SUM(SOD.LineTotal) DESC;

-- Aggregating Product Sales (2)
SELECT P.Name, SUM(SOD.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SOD
JOIN SalesLT.Product AS P
ON SOD.ProductID = P.ProductID
-- filter as per the instructions
WHERE P.ListPrice > 1000
GROUP BY P.Name
ORDER BY TotalRevenue DESC;

-- Aggregating Product Sales (3)
SELECT P.Name, SUM(SOD.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SOD
JOIN SalesLT.Product AS P
ON SOD.ProductID = P.ProductID
WHERE P.ListPrice > 1000
GROUP BY P.Name
-- add having clause as per instructions
HAVING SUM(SOD.LineTotal) > 20000
ORDER BY TotalRevenue DESC;