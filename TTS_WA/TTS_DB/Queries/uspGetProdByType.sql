 /****** Object:  StoredProcedure [dbo].[uspGetProdByType]    Script Date: 05/05/2011 21:27:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetProdByType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetProdByType]
GO

/****** Object:  StoredProcedure [dbo].[uspGetProdByType]    Script Date: 05/05/2011 21:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetProdByType]
	(
		@ProdCode varchar(5)
	)

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
	Inner join dbo.ProductType pt (nolock) on p.[iProductId] = pt.[iProductId]
	inner join dbo.type t (nolock) on t.itypeid = pt.itypeid
Where t.ProdCode = @ProdCode and [iQuanity] > 0


		
	
	RETURN

