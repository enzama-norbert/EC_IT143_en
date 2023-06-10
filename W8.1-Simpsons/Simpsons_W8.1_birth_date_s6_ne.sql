-- Q: What are the Birth Dates of the Simpsons Family Members?

-- A: Let's ask SQL Server and find out...

--1) Reload data

TRUNCATE TABLE dbo.Birth_Date;

INSERT INTO dbo.Birth_Date
SELECT v.Name
     , v.Birth_Date
  FROM dbo.v_birth_date_load AS v;


--2) Review results

SELECT t.*
  FROM dbo.Birth_Date AS t;