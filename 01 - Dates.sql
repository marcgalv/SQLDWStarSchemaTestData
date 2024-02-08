
CREATE TABLE [dbo].[Dates](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Day] [int] NOT NULL,
 CONSTRAINT [PK_Dates] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
) ON [PRIMARY],
 CONSTRAINT [DatesUniqueConstraintforFK] UNIQUE NONCLUSTERED 
(
	[DateKey] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO


