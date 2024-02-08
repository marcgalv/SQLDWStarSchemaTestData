
CREATE TABLE [dbo].[Orders](
	[OrderKey] [int] IDENTITY(1,1) NOT NULL,
	[CatA] [int] NOT NULL,
	[CatB] [int] NOT NULL,
	[CatC] [int] NOT NULL,
	[DescA] [varchar](50) NOT NULL,
	[DescB] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[CatA] ASC,
	[CatB] ASC,
	[CatC] ASC
) ON [PRIMARY],
 CONSTRAINT [OrdersUniqueConstraintforFK] UNIQUE NONCLUSTERED 
(
	[OrderKey] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO



