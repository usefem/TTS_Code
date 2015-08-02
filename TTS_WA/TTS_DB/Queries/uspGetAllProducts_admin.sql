/****** Object:  StoredProcedure [dbo].[uspGetAllProducts_admin]    Script Date: 05/05/2011 21:20:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetAllProducts_admin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetAllProducts_admin]
GO
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetAllProducts_admin] 
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */ 
	SELECT [iProductId]
		  ,[sProdName]
		  ,[sItemNo]
		  ,cast(dPrice as varchar(5)) dPrice
		  ,[sImageName]
		  ,[iWeight]
		  ,[iQuanity]
		  ,[sLongDesc]
		  ,sSizes
		  ,sColors
		  ,sVideoPath
		  ,sVideoTitle	
		  ,sProdName + ' (' + cast(iProductId as varchar(5)) + ')' as ProductPlusID
	  FROM [dbo].[Product]
	order by [sProdName]
	
	RETURN


 