 /****** Object:  StoredProcedure [dbo].[uspGetTypesByProduct_admin]    Script Date: 05/05/2011 21:36:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetTypesByProduct_admin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetTypesByProduct_admin]
GO

/****** Object:  StoredProcedure [dbo].[uspGetTypesByProduct_admin]    Script Date: 05/05/2011 21:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetTypesByProduct_admin]
(
	@iProductID int
)

as

SELECT ty.[iTypeId]
      ,[sTypeName]
      ,[ProdCode]
	  ,iProductTypeid
FROM [Type] ty
left join dbo.ProductType (nolock) pt on ty.iTypeId = pt.iTypeid  and pt.iProductID = @iProductID

order by [sTypeName]

	RETURN
