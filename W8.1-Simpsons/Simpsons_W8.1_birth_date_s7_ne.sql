CREATE PROCEDURE dbo.usp_birth_date_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_birth_date_load
PURPOSE: birth date - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/07/2023   ENZAMA       1. Built this script for Simpsons


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
 
******************************************************************************************************************/

		BEGIN

		    --1) Reload data

			TRUNCATE TABLE dbo.Birth_Date;

			INSERT INTO dbo.Birth_Date
			       SELECT v.Name
				        , v.Birth_Date
                     FROM dbo.v_birth_date_load AS v;

			
			
			--2) Review results

			 SELECT t.*
                FROM dbo.Birth_Date AS t;

		END;
	GO