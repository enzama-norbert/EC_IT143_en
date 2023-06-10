-- Q: What are the Birth Dates of the Simpsons Family Members?

-- A: Let's ask SQL Server and find out...

SELECT v.Name
     , v.Birth_Date
	 INTO dbo.Birth_Date
   FROM dbo.v_birth_date_load AS v;