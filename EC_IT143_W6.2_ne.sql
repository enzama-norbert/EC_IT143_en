-- Choose the AdventureWorks2019 database.  
USE AdventureWorks2019
GO
/*****************************************************************************************************************
NAME:    W6.2 - Adventure Works: Create Answers 
PURPOSE: Solve and craft answers using SQL to the questions generated by your section and other sources.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/26/2023   NORBERT       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
Built for W6.2 - Adventure Works: Create Answers, SQL script will contain the questions and the answers for W6.1.

I am building this script in order to show my fellow online students how to solve the EIGHT (8) Business User questions that have a single specific answer using AdventureWorks Database,
with the help of the following tools...
- Adventure Works Meta data -> https://dataedo.com/samples/html/AdventureWorks/index.html
- SQL
- SSMS

******************************************************************************************************************/

-- Q1: How many products are there in the "Product" table of AdventureWorks?
-- A1: To determine the number of products in the "Product" table of AdventureWorks, you can use the following SQL script:
 /***************** Author: Benjamin Sarpong *****************/

-- Counting the number of products in the "Product" table of AdventureWorks
SELECT COUNT(*) AS ProductCount -- Selecting and counting all rows in the "Product" table
FROM [AdventureWorks2019].[Production].[Product];

-- Q2: List all the departments in the organization.
-- A2: To retrieve a list of all the departments in the organization from the AdventureWorks database, you can use the following SQL script:
/***************** Author: Benelyn Njoku *****************/

SELECT Name -- Selecting the Name column
FROM [AdventureWorks2019].[HumanResources].[Department];-- From the Departments table


-- Q3: Who are the three top sales personnel we have in our organization? What are their email addresses and their contact information?
-- A3: To retrieve the top three sales personnel along with their email addresses and contact information, you can use the following modified SQL script:
/***************** Author: Benelyn Njoku *****************/


SELECT TOP 3 SP.BusinessEntityID, P.FirstName, P.LastName, E.EmailAddress, PH.PhoneNumber -- Select top three sales personnel with their details
FROM [AdventureWorks2019].[Sales].[SalesPerson] SP -- Retrieve data from the SalesPerson table
JOIN [AdventureWorks2019].[Person].[Person] P ON SP.BusinessEntityID = P.BusinessEntityID-- Join with the Person table to get additional information
JOIN [AdventureWorks2019].[Person].[EmailAddress] E ON P.BusinessEntityID = E.BusinessEntityID-- Join with the EmailAddress table for email addresses
JOIN [AdventureWorks2019].[Person].[PersonPhone] PH ON P.BusinessEntityID = PH.BusinessEntityID-- Join with the PersonPhone table for phone numbers
ORDER BY SP.SalesYTD DESC;  -- Order the results based on sales year-to-date in descending order

 


-- Q4: I am interested to know a list of the unique job titles in the employee table from the Adventure Works database. Can you please create a list that provides this information? Also, return the job title column in ascending Order.
-- A4: To retrieve a list of unique job titles from the employee table in the Adventure Works database and return them in ascending order, you can use the following SQL script:
/***************** Author: Judith Escobar *****************/

SELECT DISTINCT JobTitle -- Retrieve unique job titles
FROM [AdventureWorks2019].[HumanResources].[Employee] -- Retrieve data from the Employee table
ORDER BY JobTitle ASC; -- Order the job titles in ascending order



-- Q5: The companys CEO and me need to understand more about Mountain Bike orders during Q3 2012. Specifically, Can you provide a breakdown of Mountain Bike sales by frame color during Q3 2012?, including the quantity sold, List Price, Standard Cost, and estimated net revenue for each color?
-- A5: To obtain a breakdown of Mountain Bike sales by frame color during Q3 2012, along with the quantity sold, List Price, Standard Cost, and estimated net revenue for each color, you can use the following SQL query:
/***************** Author: Enzama Norbert *****************/

SELECT 
    DATEPART(MONTH, SOH.OrderDate) AS OrderMonth, -- Retrieve the month of the order date
    P.Color, -- Retrieve the color of the product
    SUM(SOD.OrderQty) AS QuantitySold, -- Calculate the total quantity sold
    SUM(SOD.LineTotal) AS ListPrice, -- Calculate the total list price
    SUM(SOD.UnitPrice * SOD.OrderQty) AS StandardCost, -- Calculate the total standard cost
    SUM(SOD.LineTotal - (SOD.UnitPrice * SOD.OrderQty)) AS EstimatedNetRevenue -- Calculate the estimated net revenue
FROM 
    [AdventureWorks2019].[Sales].[SalesOrderHeader] AS SOH -- Retrieve data from the SalesOrderHeader table
JOIN 
    [AdventureWorks2019].[Sales].[SalesOrderDetail] AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID -- Join with the SalesOrderDetail table
JOIN 
    [AdventureWorks2019].[Production].[Product] AS P ON SOD.ProductID = P.ProductID -- Join with the Product table
WHERE 
    P.ProductSubcategoryID = (SELECT ProductSubcategoryID FROM [AdventureWorks2019].[Production].[ProductSubcategory] WHERE Name = 'Mountain Bikes') -- Filter by product subcategory ID for mountain bikes
    AND YEAR(SOH.OrderDate) = 2012 -- Filter by year 2012
    AND DATEPART(QUARTER, SOH.OrderDate) = 3 -- Filter by quarter 3
GROUP BY 
    DATEPART(MONTH, SOH.OrderDate), P.Color -- Group the results by month and color
ORDER BY 
    DATEPART(MONTH, SOH.OrderDate); -- Order the results by month



-- Q6: I have noticed that on the website when I am trying to purchase items and am noticing that some items have been placed in several different sections. could you put together a list of each item and where they are located so we can put the products back in their correct spot? (Hint use the following tables Production.Product, Production.ProductInventory, and Production.Location)
-- A6: To retrieve a list of each item and their respective locations from the AdventureWorks database using the tables Production.Product, Production.ProductInventory, and Production.Location, you can use the following SQL script:
/***************** Author: Matt Hale *****************/

SELECT 
    P.ProductID, -- Select the ProductID column
    P.Name AS ProductName, -- Select the ProductName column and alias it as "ProductName"
    L.Name AS LocationName -- Select the LocationName column and alias it as "LocationName"
FROM 
    [AdventureWorks2019].[Production].[Product] AS P -- Retrieve data from the Product table and alias it as "P"
JOIN 
    [AdventureWorks2019].[Production].[ProductInventory] AS PI ON P.ProductID = PI.ProductID -- Join with the ProductInventory table based on the ProductID column
JOIN 
    [AdventureWorks2019].[Production].[Location] AS L ON PI.LocationID = L.LocationID -- Join with the Location table based on the LocationID column
ORDER BY 
    P.ProductID; -- Order the results by the ProductID column




-- Q7: Can you create a list of tables in AdventureWorks that contain a column with one of these names: Color or Weight?
-- A7: To create a list of tables in the AdventureWorks database that contain a column with either the name "Color" or "Weight", you can use the following SQL query:
/***************** Author: Enzama Norbert *****************/


SELECT TABLE_NAME
FROM AdventureWorks2019.INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME IN ('Color', 'Weight');


-- Q8: Can you create a list of tables in AdventureWorks that contain a column with one of these names: PersonID?
-- A8: To retrieve a list of tables in the AdventureWorks database that contain a column with the name "PersonID", you can use the following SQL script:
/***************** Author: Matt Hale *****************/

SELECT 
    t.name AS TableName
FROM 
    AdventureWorks2019.sys.tables AS t
JOIN 
    AdventureWorks2019.sys.columns AS c ON t.object_id = c.object_id
WHERE 
    c.name = 'PersonID'
ORDER BY 
    t.name;



SELECT GETDATE() AS my_date;