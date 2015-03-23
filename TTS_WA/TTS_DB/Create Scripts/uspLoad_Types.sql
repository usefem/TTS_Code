 set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Load_Types]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
insert into Type (sTypeName, ProdCode) Values ('Math''math')
insert into Type (sTypeName, ProdCode) Values ('Children`s Books','cb')
insert into Type (sTypeName, ProdCode) Values ('Language Arts','la')
insert into Type (sTypeName, ProdCode) Values ('Black Intrest','bi')
insert into Type (sTypeName, ProdCode) Values ('Science','sci')
insert into Type (sTypeName, ProdCode) Values ('Teaching Resources','tr')
insert into Type (sTypeName, ProdCode) Values ('Spanish','sp')
insert into Type (sTypeName, ProdCode) Values ('Games','ga')
insert into Type (sTypeName, ProdCode) Values ('Religious','rel')
insert into Type (sTypeName, ProdCode) Values ('Specialty Items','si')
insert into Type (sTypeName, ProdCode) Values ('Clothing','clo')
insert into Type (sTypeName, ProdCode) Values ('Others','oth')
insert into Type (sTypeName, ProdCode) Values ('2$ and Under','brg')	
insert into Type (sTypeName, ProdCode) Values ('Character Education','ce')	
insert into Type (sTypeName, ProdCode) Values ('Gifts for thr Teacher','gf')	
	RETURN

