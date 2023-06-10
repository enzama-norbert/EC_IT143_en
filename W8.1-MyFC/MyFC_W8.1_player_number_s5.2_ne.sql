DROP TABLE IF EXISTS dbo.tblPlayer_Number;
GO

CREATE TABLE dbo.tblPlayer_Number
(Name   VARCHAR(100) NOT NULL,
 Number INT NOT NULL,
 CONSTRAINT PK_tblPlayer_Number PRIMARY KEY CLUSTERED(Name ASC)
);
GO