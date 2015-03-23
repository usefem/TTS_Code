/****** Object:  Table [dbo].[Product]    Script Date: 02/23/2014 13:00:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Product](
	[iProductId] [int] IDENTITY(1,1) NOT NULL,
	[sProdName] [varchar](75) NOT NULL,
	[sItemNo] [varchar](20) NULL,
	[dPrice] [money] NOT NULL,
	[sImageName] [varchar](75) NULL,
	[iWeight] [int] NULL,
	[iQuanity] [int] NULL,
	[sLongDesc] [varchar](3000) NULL,
	[sSizes] [varchar](50) NULL,
	[sColors] [varchar](100) NULL,
	[sVideoPath] [varchar](100) NULL,
	[sVideoTitle] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[iProductId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Table [dbo].[FeaturedProducts]    Script Date: 02/23/2014 13:01:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FeaturedProducts](
	[iFeaturedProdId] [int] IDENTITY(1,1) NOT NULL,
	[iProductID] [int] NOT NULL,
	[iSort] [int] NULL,
 CONSTRAINT [PK_FeaturedProducts] PRIMARY KEY CLUSTERED 
(
	[iFeaturedProdId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[FeaturedProducts]  WITH CHECK ADD  CONSTRAINT [FK_FeaturedProducts_Product] FOREIGN KEY([iProductID])
REFERENCES [dbo].[Product] ([iProductId])
GO



/****** Object:  Table [dbo].[Type]    Script Date: 02/23/2014 13:02:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Type](
	[iTypeId] [int] IDENTITY(1,1) NOT NULL,
	[sTypeName] [varchar](75) NOT NULL,
	[ProdCode] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[iTypeId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ProductType]    Script Date: 02/23/2014 13:03:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductType](
	[iProductTypeid] [int] IDENTITY(1,1) NOT NULL,
	[iProductID] [int] NOT NULL,
	[iTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iProductTypeid] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD FOREIGN KEY([iProductID])
REFERENCES [dbo].[Product] ([iProductId])
GO

ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD FOREIGN KEY([iTypeID])
REFERENCES [dbo].[Type] ([iTypeId])
GO


/****** Object:  Table [dbo].[Coupon]    Script Date: 02/23/2014 12:58:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Coupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[szCouponCode] [varchar](15) NOT NULL,
	[szCouponName] [varchar](50) NOT NULL,
	[szDescription] [varchar](2000) NOT NULL,
	[fDiscount] [float] NOT NULL,
	[dtStartDate] [datetime] NOT NULL,
	[dtEndDate] [datetime] NOT NULL,
 CONSTRAINT [Coupon_PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

