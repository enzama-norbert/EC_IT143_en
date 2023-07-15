SELECT pp.*
	FROM Person.Person AS pp
WHERE pp.FirstName = 'John';



/* Creating the Missing Index*/
USE [AdventureWorks2019]
GO
CREATE NONCLUSTERED INDEX My_NewIndex
ON [Person].[Person] ([FirstName])

GO