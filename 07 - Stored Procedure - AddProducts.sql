
CREATE PROCEDURE [dbo].[AddProducts](
	@intQtdProducts INT = 100
)
AS
BEGIN

	DECLARE @LastestCatA int
	DECLARE @LastestCatB int
	DECLARE @LastestCatC int

	-- Add new dates to the Dates Table
	-- @intQtdDates - Number of dates to add at the bottom of the calendar. Just add new dates in the future.
	IF NOT EXISTS(SELECT TOP 1 * FROM [dbo].[Products])
		BEGIN
			-- Table is empty. create the first date.
			SET @LastestCatA = 1
			SET @LastestCatB = 1
			SET @LastestCatC = 0
		END
	ELSE
		BEGIN

			-- Get the Lastest Value for each Column.
			SELECT @LastestCatA = MAX([CatA]) FROM [dbo].[Products]
			SELECT @LastestCatB = MAX([CatB]) FROM [dbo].[Products] WHERE [CatA] = @LastestCatA
			SELECT @LastestCatC = MAX([CatC]) FROM [dbo].[Products] WHERE [CatA] = @LastestCatA AND [CatB] = @LastestCatB

		END

		--SELECT @LastestCatA, @LastestCatB, @LastestCatC
		DECLARE @count INT
		SET @count = 1

		DECLARE @CatAInsert INT
		SET @CatAInsert = @LastestCatA
		WHILE @CatAInsert <= 999
		BEGIN
			DECLARE @CatBInsert INT
			SET @CatBInsert = @LastestCatB
			WHILE @CatBInsert <= 999
			BEGIN
				DECLARE @CatCInsert INT
				SET @CatCInsert = @LastestCatC + 1
				WHILE @CatCInsert <= 999
				BEGIN
					-- INSERT New Products in order to make it easier.
					--SELECT @CatAInsert, @CatBInsert, @CatCInsert
						
					INSERT INTO [dbo].[Products] ([CatA], [CatB], [CatC], [DescA], [DescB]) VALUES(@CatAInsert, @CatBInsert, @CatCInsert, RIGHT(CONVERT(VARCHAR(255), NEWID()), 5), RIGHT(CONVERT(VARCHAR(255), NEWID()), 5)) 

					SET @count = @count + 1
					IF @count = @intQtdProducts + 1
						RETURN 0 -- Break the Loops because it has inserted the requested amount of Products.

					SET @CatCInsert = @CatCInsert + 1

				END
				SET @CatBInsert = @CatBInsert + 1
			END
			SET @CatAInsert = @CatAInsert + 1
		END

END
GO


