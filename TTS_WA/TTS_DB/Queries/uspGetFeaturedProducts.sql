/****** Object:  StoredProcedure [dbo].[uspGetFeaturedProducts]    Script Date: 05/05/2011 21:25:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetFeaturedProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetFeaturedProducts]
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGetFeaturedProducts]
AS
	/* SET NOCOUNT ON */ 
SELECT 
	  p.iproductid
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
  FROM [dbo].[Product] p (nolock)
	Inner join dbo.FeaturedProducts fp (nolock) on p.[iProductId] = fp.[iProductId]
Where [iQuanity] > 0
Order By fp.iSort
	
	RETURN



 
 