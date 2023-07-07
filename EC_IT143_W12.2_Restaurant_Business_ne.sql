/*****************************************************************************************************************
NAME:    EC_IT143_W12.2_RestaurantBusinessRankings_ne
PURPOSE: RestaurantBusinessRankings data sets question and answer scripts

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/03/2023   ENZAMA       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script translates RestaurantBusinessRankings data set questions into SQL statements?
 
******************************************************************************************************************/

-- Q1: Can we identify the top-performing restaurants in terms of sales and units and determine if there is any correlation between sales and units? Additionally, can we analyze the sales growth and unit growth for these restaurants? ?
-- A1.0: To Identify top-performing restaurants based on sales

SELECT TOP 5
  Rank,
  Restaurant,
  Sales,
  Units
FROM
  Top250
ORDER BY
  Sales DESC;

-- A1.1: To Calculate correlation between sales and units manually
SELECT
  (SUM(Sales * Units) - COUNT(*) * AVG(Sales) * AVG(Units)) /
  ((COUNT(*) - 1) * STDEV(Sales) * STDEV(Units)) AS Correlation
FROM
  Top250;



-- Q2: What are the top 3 restaurants from the Independence 100 restaurant , which city has the highest average check amount and serves the most meals??
-- A2: To find the top 3 restaurants from the Independence 100 restaurant we shall use the following script.

SELECT TOP 3 I.City
FROM Independence100 I
JOIN (
    SELECT City, MAX(Average_Check) AS MaxAverageCheck
    FROM Independence100
    GROUP BY City
) AS MaxCheck ON I.City = MaxCheck.City AND I.Average_Check = MaxCheck.MaxAverageCheck
ORDER BY I.Meals_Served DESC



-- Q3: What is the the restaurant with the highest sales among all the three operating restaurants?
-- A3: To determine the restaurant with the highest sales among the three ,use the below script .

--Question created by another student
--Author: Michael Moser

SELECT  TOP 1 Restaurant, MAX(Sales) AS HighestSales
FROM (
    SELECT Restaurant, Sales FROM Future50
    UNION ALL
    SELECT Restaurant, Sales FROM Independence100
    UNION ALL
    SELECT Restaurant, Sales FROM Top250
) AS AllRestaurants
GROUP BY Restaurant
ORDER BY HighestSales DESC


-- Q4: The General Manager wants to know the What is the average sales of the three restaurants and also the lowest sales value?
-- A4: To calculate the average sales of the three restaurants and determine the lowest sales value, we can use the following query.

--Question created by another student
--Author: Sarah Rwot-Omiya

SELECT AVG(Sales) AS AverageSales, MIN(Sales) AS LowestSales
FROM (
    SELECT Sales FROM Future50
    UNION ALL
    SELECT Sales FROM Independence100
    UNION ALL
    SELECT Sales FROM Top250
) AS AllSales
