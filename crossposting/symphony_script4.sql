--add symphony_with_id to pass data from symphony
USE [CrossPosting_test2]
GO

/****** Object:  Table [dbo].[Symphony]    Script Date: 6/24/2023 9:27:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Symphony_with_id](
    id int identity(1,1) primary key,
	[Hotel] [varchar](255) NULL,
	[Groups] [varchar](255) NULL,
	[RevenueCenter] [varchar](255) NULL,
	[CheckNumber] [int] NULL,
	[BusinessDate] [date] NULL,
	[TransactionDateTime] [datetime] NULL,
	[ItemName] [varchar](255) NULL,
	[ItemNumber] [int] NULL,
	[LineCount] [int] NULL,
	[LineTotal] [decimal](18, 2) NULL,
	[CheckEmployee] [varchar](255) NULL,
	[TransactionEmployee] [varchar](255) NULL,
	[AuthorizingEmployee] [varchar](255) NULL,
	[ReferenceInfo] [varchar](255) NULL,
	[Filename] [varchar](255) NULL,
	[DateProcessed] [datetime] NULL,
	[uniq] [int] NOT NULL)

ALTER TABLE [dbo].[Symphony_with_id] ADD  CONSTRAINT [DF__Symphony__DatePr__1CBC4616_id]  DEFAULT (getdate()) FOR [DateProcessed]
GO
