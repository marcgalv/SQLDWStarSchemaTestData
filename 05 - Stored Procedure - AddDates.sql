
CREATE PROCEDURE [dbo].[AddDates](
	@intQtdDates INT = 100
)
AS
BEGIN

	DECLARE @LastestDate DATE

	-- Add new dates to the Dates Table
	-- @intQtdDates - Number of dates to add at the bottom of the calendar. Just add new dates in the future.
	IF NOT EXISTS(SELECT TOP 1 * FROM [dbo].[Dates])
		BEGIN
			-- Table is empty. create the first date.
			SET @LastestDate = CAST('19991231' AS DATE)
		END
	ELSE
		BEGIN

			-- Get the Lastest Date
			SELECT Top 1 @LastestDate = [Date] FROM [dbo].[Dates] ORDER BY [Date] DESC
			--SELECT @LastestDate

		END

	DECLARE @count INT
	SET @count = 1
	WHILE @count <= @intQtdDates
	BEGIN
		DECLARE @InsertDate Date
		SET @InsertDate = DATEADD(day,@count,@LastestDate)
		--SELECT @InsertDate
		INSERT INTO [dbo].[Dates] ([DateKey], [Date], [Year], [Month], [Day]) VALUES(CONVERT(CHAR(8), @InsertDate, 112), @InsertDate, YEAR(@InsertDate), MONTH(@InsertDate), DAY(@InsertDate))
		SET @count = @count + 1
	END

END
GO


