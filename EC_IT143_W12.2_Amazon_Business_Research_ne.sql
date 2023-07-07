/*****************************************************************************************************************
NAME:    EC_IT143_W12.2_AmazonBusinessResearch_ne
PURPOSE: AmazonBusinessResearch data sets question and answer scripts

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/03/2023   ENZAMA       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script translates AmazonBusinessResearch data set questions into SQL statements?
 
******************************************************************************************************************/

-- Q1: We need to Know Which delivery person has the highest average ratings, and in which city do they operate?
-- A1: To Find the delivery person with the highest average ratings and their operating city

SELECT
  dp.Delivery_person_ID,
  dp.City,
  AVG(dp.Delivery_person_Ratings) AS Average_Ratings
FROM
  encoded_cleaned_test AS ect
JOIN
  updated AS dp ON ect.Delivery_person_ID = dp.Delivery_person_ID
GROUP BY
  dp.Delivery_person_ID,
  dp.City
HAVING
  AVG(dp.Delivery_person_Ratings) = (
    SELECT
      MAX(Average_Ratings)
    FROM
      (
        SELECT
          AVG(dp.Delivery_person_Ratings) AS Average_Ratings
        FROM
          encoded_cleaned_test AS ect
        JOIN
          updated AS dp ON ect.Delivery_person_ID = dp.Delivery_person_ID
        GROUP BY
          dp.Delivery_person_ID
      ) AS subquery
  );



-- Q2: What are the top three cities with the highest number of multiple deliveries? 
-- A2: To Find the top three cities with the highest number of multiple deliveries


SELECT TOP 3
  City,
  COUNT(*) AS Num_Multiple_Deliveries
FROM
  updated
WHERE
  multiple_deliveries = 1
GROUP BY
  City
ORDER BY
  Num_Multiple_Deliveries DESC;



-- Q3: Are there any differences in average delivery times based on the festival season? Can we identify specific festivals during which delivery times tend to be longer or shorter compared to non-festival periods??
-- A3: Calculate average delivery times based on the festival season

SELECT
  Festival,
  AVG(Time_taken_min) AS Average_Delivery_Time
FROM
  updated
GROUP BY
  Festival;


-- Q4: The Amazon Last-Mile Delivery Manager wants to identify cities with the highest number of multiple deliveries. They aim to optimize the last-mile delivery process by focusing on areas where multiple deliveries are common, ensuring timely and efficient delivery to customers.?
-- A4: To Identify cities with the highest number of multiple deliveries

--Question created by another student
--Author: Sarah Rwot-Omiya

SELECT
  City,
  COUNT(*) AS Num_Multiple_Deliveries
FROM
  updated
WHERE
  multiple_deliveries = 1
GROUP BY
  City
ORDER BY
  Num_Multiple_Deliveries DESC;

