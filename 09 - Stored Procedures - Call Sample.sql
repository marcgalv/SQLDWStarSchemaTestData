DELETE FROM [dbo].[Sales]
DELETE FROM [dbo].[Products]
DELETE FROM [dbo].[Orders]
DELETE FROM [dbo].[Dates]

EXEC [dbo].[AddDates] 4017 -- 10 Years 2000 to 2010
--SELECT * FROM [dbo].[Dates]

EXEC [dbo].[AddOrders] 30
--SELECT * FROM [dbo].[Orders]

EXEC [dbo].[AddProducts] 100
--SELECT * FROM [dbo].[Products]

EXEC [dbo].[AddSales]
--SELECT Count(*) FROM [Sales]