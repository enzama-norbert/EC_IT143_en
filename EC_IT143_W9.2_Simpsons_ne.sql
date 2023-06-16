/*****************************************************************************************************************
NAME:    EC_IT143_W9.2_Simpsons_ne
PURPOSE: Simpsons data sets question and answer scripts


MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2023   JJAUSSI       1. Built this script for EC IT143, Simpsons


RUNTIME: 
1s

NOTES: 
This script translates Simpsons data set questions into SQL statements?
 
******************************************************************************************************************/

-- Q1: How many transactions were made by each member of the Simpsons Family?
-- A1: To get the total transaction done by the members of simpsons family, we shall use the below script.

--Question created by another student
--Author: Sarah Rwot-Omiya

SELECT fd.Member_ID, fd.Name, COUNT(*) AS total_transactions
FROM Family_Data fd
JOIN FBS_Viza_Costmo fvc ON fd.Name = fvc.Member_Name
GROUP BY fd.Member_ID, fd.Name;



-- Q2: What is the total debit and credit amount for each member in the Simpsons Family?
-- A2: To get the total debit and credit amount for each member. We shall use the below script.


SELECT fd.Member_ID, fd.Name, SUM(fvc.Debit) AS total_debit, SUM(fvc.Credit) AS total_credit
FROM Family_Data fd
JOIN FBS_Viza_Costmo fvc ON fd.Name = fvc.Member_Name
GROUP BY fd.Member_ID, fd.Name;



-- Q3: What is the total amount spent by each member in the Simpsons Family?
-- A3: To get the total amount spent by each member, Use the bellow script.

SELECT fd.Member_ID, fd.Name, SUM(pe.Amount) AS total_amount
FROM Family_Data fd
JOIN Planet_Express pe ON fd.Name = pe.Card_Member
GROUP BY fd.Member_ID, fd.Name;



-- Q4: What is the average debit and credit amount per transaction for each member in the Family?
-- A4: To get the average debit and credit amount per transaction for each member, Use the bellow script.

SELECT fd.Member_ID, fd.Name, AVG(fvc.Debit) AS avg_debit_fbs, AVG(fvc.Credit) AS avg_credit_fbs
FROM Family_Data fd
JOIN FBS_Viza_Costmo fvc ON fd.Name = fvc.Member_Name
GROUP BY fd.Member_ID, fd.Name;
