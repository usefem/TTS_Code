/****** Object:  StoredProcedure [dbo].[uspInsProduct_admin]    Script Date: 05/05/2011 21:38:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspInsProduct_admin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspInsProduct_admin]
GO

/****** Object:  StoredProcedure [dbo].[uspInsProduct_admin]    Script Date: 05/05/2011 21:39:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsProduct_admin] 
(
	@iProductID int,
	@sProdName varchar(75),
	@sItemNo varchar(20),
	@dPrice float,
	@sImageName varchar(75),
	@iWeight int,
	@iQuanity int,
	@sLongDesc varchar(3000),
	@sSizes varchar(50),
	@sColors varchar(100),
	@sVideoPath varchar(100),
	@sVideoTitle varchar(150)
)

as

if @iProductID = 0
BEGIN
	INSERT INTO [Product]
           (sProdName
           ,sItemNo
           ,dPrice
           ,sImageName
           ,iWeight
           ,iQuanity
           ,sLongDesc
		  ,sSizes
		  ,sColors
		  ,sVideoPath
		  ,sVideoTitle)
     VALUES
           (@sProdName
           ,@sItemNo
           ,@dPrice
           ,@sImageName
           ,@iWeight
           ,@iQuanity
           ,@sLongDesc
		  ,@sSizes
		  ,@sColors
		  ,@sVideoPath
		  ,@sVideoTitle)
END
else
BEGIN
	UPDATE [Product]
		SET [sProdName] = @sProdName
		,[sItemNo] = @sItemNo
		,[dPrice] = @dPrice
		,[sImageName] = @sImageName
		,[iWeight] = @iWeight
		,[iQuanity] = @iQuanity
		,[sLongDesc] = @sLongDesc
		,[sSizes] = @sSizes
		,[sColors] = @sColors
		,sVideoPath = @sVideoPath
		,sVideoTitle = @sVideoTitle

	WHERE iProductID = @iProductID          

END



RETURN 
 