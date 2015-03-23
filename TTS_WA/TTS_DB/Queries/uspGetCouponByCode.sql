 /****** Object:  StoredProcedure [dbo].[uspGetCouponByCode]    Script Date: 05/05/2011 21:24:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetCouponByCode]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetCouponByCode]
GO
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetCouponByCode]
	(
		@szCouponCode varchar(15)
	)
	AS
	/* SET NOCOUNT ON */ 
SELECT [CouponID]
      ,[szCouponCode]
      ,[szCouponName]
      ,[szDescription]
      ,[fDiscount]
      ,[dtStartDate]
      ,[dtEndDate]
  FROM [dbo].[Coupon]
WHERE szCouponCode = @szCouponCode
	RETURN



