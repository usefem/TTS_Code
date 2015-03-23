/****** Object:  StoredProcedure [dbo].[uspInsProductTypesByProdID_admin]    Script Date: 05/05/2011 21:41:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspInsProductTypesByProdID_admin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspInsProductTypesByProdID_admin]
GO

/****** Object:  StoredProcedure [dbo].[uspInsProductTypesByProdID_admin]    Script Date: 05/05/2011 21:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsProductTypesByProdID_admin] 
(
	@iProductID int,
	@iTypeID int
)

as

INSERT INTO [ProductType]
           ([iProductID]
           ,[iTypeID])
     VALUES
           (@iProductID
           ,@iTypeID)
           
	RETURN
 