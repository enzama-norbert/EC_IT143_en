-- Q1: What is the player numbers in the Team?

-- A1: Let's ask SQL Server and find out...

--1) Reload data

TRUNCATE TABLE dbo.tblPlayer_Number;

INSERT INTO dbo.tblPlayer_Number
SELECT v.Name
     , v.Number
  FROM dbo.v_player_number_load AS v;


--2) Review results

SELECT t.*
  FROM dbo.tblPlayer_Number AS t;