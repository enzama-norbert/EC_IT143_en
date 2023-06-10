CREATE PROCEDURE dbo.usp_player_number_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_player_number_load
PURPOSE: Player Number - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/07/2023   ENZAMA       1. Built this script for MyFC


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
 
******************************************************************************************************************/

		BEGIN

		    --1) Reload data

			TRUNCATE TABLE dbo.tblPlayer_Number;

			INSERT INTO dbo.tblPlayer_Number
			       SELECT v.Name
				        , v.Number
                     FROM dbo.v_player_number_load AS v;

			
			
			--2) Review results

			 SELECT t.*
                FROM dbo.tblPlayer_Number AS t;

		END;
	GO