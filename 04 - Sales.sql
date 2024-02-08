
CREATE TABLE [dbo].[Sales](
	[DateKey] [int] NOT NULL,
	[ProductKey] [int] NOT NULL,
	[OrderKey] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitValue] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC,
	[ProductKey] ASC,
	[OrderKey] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Dates] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dates] ([DateKey])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Dates]
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Orders] FOREIGN KEY([OrderKey])
REFERENCES [dbo].[Orders] ([OrderKey])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Orders]
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Products] ([ProductKey])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
