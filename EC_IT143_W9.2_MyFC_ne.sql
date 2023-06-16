/*****************************************************************************************************************
NAME:    EC_IT143_W9.2_MyFC_ne
PURPOSE: MyFC data sets question and answer scripts

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2023   JJAUSSI       1. Built this script for EC IT143, MyFC


RUNTIME: 
1s

NOTES: 
This script translates MyFC data set questions into SQL statements?
 
******************************************************************************************************************/

-- Q1: Which player from the senior team has the highest salaries and what positions do they play?
-- A1: To get the player with the highest salaries and the position he plays, We shall use the below script.


SELECT TOP 1 pd.pl_name, p.p_name, pf.mtd_salary
FROM tblPlayerFact pf
JOIN tblPlayerDim pd ON pf.pl_id = pd.pl_id
JOIN tblPositionDim p ON pd.p_id = p.p_id
JOIN tblTeamDim td ON pd.t_id = td.t_id
WHERE td.t_code = 'S'
ORDER BY pf.mtd_salary DESC;



-- Q2: What is the average salary of players in each position of the  team?
-- A2: To get the average salary of players in each position of the team, We shall use the below script.

SELECT p.p_name, AVG(pf.mtd_salary) AS avg_salary
FROM tblPlayerFact pf
JOIN tblPlayerDim pd ON pf.pl_id = pd.pl_id
JOIN tblPositionDim p ON pd.p_id = p.p_id
JOIN tblTeamDim td ON pd.t_id = td.t_id
WHERE td.t_code = 'S'
GROUP BY p.p_name;



-- Q3: The Marketing Directors are interested in identifying the highest and lowest salary paid to the players. Can we analyze the data to determine the highest and lowest salary among the players of a senior team?
-- A3: To get the highest and lowest salary among the players of a specific team, we use the below script


SELECT MAX(pf.mtd_salary) AS highest_salary, MIN(pf.mtd_salary) AS lowest_salary
FROM tblPlayerFact pf
JOIN tblPlayerDim pd ON pf.pl_id = pd.pl_id
JOIN tblTeamDim td ON pd.t_id = td.t_id
WHERE td.t_code = 'S';



-- Q4: The General Manager is interested in knowing, Which players on the senior team have a salary higher than the team's average salary?
-- A4: To get the List of players on the senior team with a salary higher than the team's average salary we shall use the script written below.

--Question created by another student
--Author: Sarah Rwot-Omiya

SELECT pd.pl_name, pf.mtd_salary
FROM tblPlayerFact pf
JOIN tblPlayerDim pd ON pf.pl_id = pd.pl_id
JOIN tblTeamDim td ON pd.t_id = td.t_id
WHERE td.t_code = 'S'
  AND pf.mtd_salary > (
    SELECT AVG(pf.mtd_salary)
    FROM tblPlayerFact pf
    JOIN tblPlayerDim pd ON pf.pl_id = pd.pl_id
    JOIN tblTeamDim td ON pd.t_id = td.t_id
    WHERE td.t_code = 'S'
  );