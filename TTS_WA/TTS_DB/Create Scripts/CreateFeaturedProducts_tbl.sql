/****** Object:  Table [dbo].[FeaturedProducts]    Script Date: 05/05/2011 22:09:53 ******/
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
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FeaturedProducts]  WITH CHECK ADD  CONSTRAINT [FK_FeaturedProducts_Product] FOREIGN KEY([iProductID])
REFERENCES [dbo].[Product] ([iProductId])
GO
ALTER TABLE [dbo].[FeaturedProducts] CHECK CONSTRAINT [FK_FeaturedProducts_Product] 