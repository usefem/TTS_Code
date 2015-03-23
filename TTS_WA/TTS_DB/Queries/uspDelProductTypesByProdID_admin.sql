/****** Object:  StoredProcedure [dbo].[uspDelProductTypesByProdID_admin]    Script Date: 05/05/2011 21:14:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspDelProductTypesByProdID_admin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspDelProductTypesByProdID_admin]
GO

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspDelProductTypesByProdID_admin]
(
	@iProductID int
)

as

DELETE FROM [dbo].[ProductType]
      WHERE iProductID = @iProductID
      
	RETURN

 