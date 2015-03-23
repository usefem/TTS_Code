/****** Object:  StoredProcedure [dbo].[uspGetFeaturedProducts]    Script Date: 11/28/2010 18:36:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[uspGetFeaturedProducts]    Script Date: 11/28/2010 18:38:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetFeaturedProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetFeaturedProducts]
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
  FROM [dbo].[Product] p (nolock)
	Inner join dbo.FeaturedProducts fp (nolock) on p.[iProductId] = fp.[iProductId]
Where [iQuanity] > 0
Order By fp.iSort
	
	RETURN



 