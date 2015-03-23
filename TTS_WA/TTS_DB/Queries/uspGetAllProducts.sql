/****** Object:  StoredProcedure [dbo].[uspGetAllProducts]    Script Date: 05/05/2011 21:18:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetAllProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetAllProducts]
GO
/****** Object:  StoredProcedure [dbo].[uspGetAllProducts]    Script Date: 05/05/2011 21:16:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetAllProducts]
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
  FROM [dbo].[Product] (nolock)
Where [iQuanity] > 0	
	RETURN

 