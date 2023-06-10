DROP VIEW IF EXISTS dbo.v_birth_date_load;
GO

CREATE VIEW dbo.v_birth_date_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_birth_date_load
PURPOSE: Create the birth date - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/07/2023   ENZAMA       1. Built this script for Simpsons


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Daata Manipulation.
 
******************************************************************************************************************/

-- Q1: What is the player numbers in the Team?

-- A1: Let's ask SQL Server and find out...

SELECT Name AS Name, Birth_Date AS Birth_Date

   FROM [Simpsons].[dbo].[Family_Data]