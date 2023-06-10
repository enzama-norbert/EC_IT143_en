DROP VIEW IF EXISTS dbo.v_player_number_load;
GO

CREATE VIEW dbo.v_player_number_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_player_number_load
PURPOSE: Create the player number - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/07/2023   ENZAMA       1. Built this script for MyFC


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Daata Manipulation.
 
******************************************************************************************************************/

-- Q1: What is the player numbers in the Team?

-- A1: Let's ask SQL Server and find out...

SELECT pl_name AS Name, pl_num AS Number

   FROM [MyFC].[dbo].[tblPlayerDim]