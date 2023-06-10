DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_hello_world_load
PURPOSE: Create the Hello World - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/07/2023   ENZAMA       1. Built this script for EC IT143


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Daata Manipulation.
 
******************************************************************************************************************/

-- Q1: What is the current date and time?

-- A1: Let's ask SQL Server and find out...

SELECT 'Hello World' AS my_message
     , GETDATE() AS current_date_time;