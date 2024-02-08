
CREATE PROCEDURE [dbo].[AddSales]
AS
BEGIN

	SELECT A.[DateKey], B.[ProductKey], C.[OrderKey]
		INTO #TempResult
		FROM [dbo].[Dates] A, [dbo].[Products] B, [dbo].[Orders] C
			EXCEPT
		SELECT [DateKey], [ProductKey], [OrderKey] FROM [dbo].[Sales];

	INSERT INTO [dbo].[Sales] ([DateKey], [ProductKey], [OrderKey], [Quantity], [UnitValue]) 
		SELECT B.[DateKey], B.[ProductKey], B.[OrderKey]
			,ABS(CHECKSUM(NEWID())) % 100 AS [Quantity]
			,ABS(CHECKSUM(NEWID())) % 100 AS [UnitValue]
			FROM #TempResult B

	DROP TABLE #TempResult

END
GO


