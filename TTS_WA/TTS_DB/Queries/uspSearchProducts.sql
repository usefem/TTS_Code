 /****** Object:  StoredProcedure [dbo].[uspSearchProducts]    Script Date: 05/05/2011 21:44:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspSearchProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspSearchProducts]
GO

/****** Object:  StoredProcedure [dbo].[uspSearchProducts]    Script Date: 05/05/2011 21:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSearchProducts] 
(
	@SearchText varchar(20)
)

AS

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
	FROM [TTSDB].[dbo].[Product]
	Where (sProdName like '%' + @SearchText +  '%'
		or sLongDesc like '%' + @SearchText +  '%')
	and iQuanity > 0
	Order by sProdName
	RETURN

