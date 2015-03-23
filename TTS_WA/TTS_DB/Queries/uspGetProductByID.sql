 /****** Object:  StoredProcedure [dbo].[uspGetProductByID]    Script Date: 05/05/2011 21:31:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetProductByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetProductByID]

GO
/****** Object:  StoredProcedure [dbo].[uspGetProductByID]    Script Date: 05/05/2011 21:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetProductByID]
	(
		@ProdID int
	)
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
  FROM [dbo].[Product]
WHERE [iProductId] = @ProdID	
	RETURN


