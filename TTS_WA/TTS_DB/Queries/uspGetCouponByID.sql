 /****** Object:  StoredProcedure [dbo].[uspGetCouponByID]    Script Date: 05/05/2011 21:31:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[uspGetCouponByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[uspGetCouponByID]

GO
/****** Object:  StoredProcedure [dbo].[uspGetCouponByID]    Script Date: 05/05/2011 21:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGetCouponByID]
	@iCouponID int = 0
AS
SELECT [CouponID]
      ,[szCouponCode]
      ,[szCouponName]
      ,[szDescription]
      ,[fDiscount]
      ,[dtStartDate]
      ,[dtEndDate]
  FROM [dbo].[Coupon]
  WHERE [CouponID] = @iCouponID

RETURN 0