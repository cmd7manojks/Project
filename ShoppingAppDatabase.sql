USE [ShoppingApp]
GO
/****** Object:  Table [dbo].[AdminTable]    Script Date: 5/14/2020 8:48:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminTable](
	[AdminId] [int] IDENTITY(100,1) NOT NULL,
	[AdminName] [varchar](50) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryTable]    Script Date: 5/14/2020 8:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryTable](
	[CatId] [int] NOT NULL,
	[CatName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTable]    Script Date: 5/14/2020 8:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTable](
	[OrderNo] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Amount] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTable]    Script Date: 5/14/2020 8:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTable](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[AvailableItems] [int] NOT NULL,
	[CatId] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 5/14/2020 8:48:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[MobileNumber] [bigint] NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductTable] ADD  DEFAULT ((0)) FOR [AvailableItems]
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductTable] ([ProductId])
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[UserTable] ([UserId])
GO
ALTER TABLE [dbo].[ProductTable]  WITH CHECK ADD FOREIGN KEY([CatId])
REFERENCES [dbo].[CategoryTable] ([CatId])
GO
