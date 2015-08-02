 /****** Object:  StoredProcedure [dbo].[uspSaveCoupon_admin]    Script Date: 05/05/2011 21:31:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspSaveCoupon_admin]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspSaveCoupon_admin]

GO
/****** Object:  StoredProcedure [dbo].[uspSaveCoupon_admin]    Script Date: 05/05/2011 21:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspSaveCoupon_admin]
(@iCouponID int = 0,
@szCouponCode varchar(15),
@szCouponName varchar(50),
@szDescription varchar(2000),
@fDiscount float,
@dtStartDate datetime,
@dtEndDate datetime)
AS

if @iCouponID = 0
BEGIN
INSERT INTO [dbo].[Coupon]
           ([szCouponCode]
           ,[szCouponName]
           ,[szDescription]
           ,[fDiscount]
           ,[dtStartDate]
           ,[dtEndDate])
     VALUES
           (@szCouponCode,
           @szCouponName,
           @szDescription,
           @fDiscount,
           @dtStartDate,
           @dtEndDate)
END
ELSE
BEGIN
	UPDATE [dbo].[Coupon]
	   SET [szCouponCode] = @szCouponCode
		  ,[szCouponName] = @szCouponName
		  ,[szDescription] = @szDescription
		  ,[fDiscount] = @fDiscount
		  ,[dtStartDate] = @dtStartDate
		  ,[dtEndDate] = @dtEndDate
	 WHERE CouponID = @iCouponID
END

Return