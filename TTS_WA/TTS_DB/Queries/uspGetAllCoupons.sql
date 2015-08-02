 /****** Object:  StoredProcedure [dbo].[uspGetAllCoupons]    Script Date: 05/05/2011 21:31:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetAllCoupons]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetAllCoupons]

GO
/****** Object:  StoredProcedure [dbo].[uspGetAllCoupons]    Script Date: 05/05/2011 21:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGetAllCoupons]

AS
SELECT [CouponID]
      ,[szCouponCode]
      ,[szCouponName]
      ,[szDescription]
      ,[fDiscount]
      ,[dtStartDate]
      ,[dtEndDate]
  FROM [dbo].[Coupon]


RETURN 0
