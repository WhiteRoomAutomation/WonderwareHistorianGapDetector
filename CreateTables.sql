USE [Runtime]
GO

/****** Object:  Table [dbo].[WatchDogTags]    Script Date: 4/7/2021 3:16:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WatchDogTags](
	[TagName] [nvarchar](256) NOT NULL,
	[ValuesPerMinute] [int] NOT NULL
) ON [PRIMARY]

GO

USE [Runtime]
GO

/****** Object:  Table [dbo].[WD_Gaps]    Script Date: 4/7/2021 3:17:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WD_Gaps](
	[WD_Name] [nvarchar](256) NOT NULL,
	[GapStart] [datetime] NULL,
	[GapEnd] [datetime] NULL,
	[GapFilledDate] [datetime] NULL
) ON [PRIMARY]

GO

