-- Q1: What is the player numbers in the Team?

-- A1: Let's ask SQL Server and find out...

SELECT v.Name
     , v.Number
	 INTO dbo.tblPlayer_Number
   FROM dbo.v_player_number_load AS v;
   