-- this script creates the table IBS_with_id that has IBS structure plus an id column

USE [CrossPosting_test2]
GO

/****** Object:  Table [dbo].[IBS]    Script Date: 6/23/2023 3:26:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IBS_with_id](
    id int identity(1,1) primary key,
	[Outlet] [varchar](50) NOT NULL,
	[Invoice] [int] NOT NULL,
	[CustNumber] [varchar](50) NOT NULL,
	[ReferenceNumber] [varchar](50) NOT NULL,
	[Verification] [varchar](50) NOT NULL,
	[ActualDateTime] [datetime] NOT NULL,
	[Empl] [int] NOT NULL,
	[Tender] [varchar](255) NOT NULL,
	[AmountPaid] [decimal](18, 2) NOT NULL,
	[Tip] [decimal](18, 2) NOT NULL,
	[ZDate] [date] NOT NULL,
	[Z] [varchar](255) NOT NULL,
	[Change] [decimal](18, 2) NOT NULL,
	[Filename] [varchar](255) NOT NULL,
	[DateProcessed] [datetime] NOT NULL)
ALTER TABLE [dbo].[IBS_with_id] ADD  CONSTRAINT [DF_IBS_DateProcessed_id]  DEFAULT (getdate()) FOR [DateProcessed]
GO
--drop table [dbo].[IBS_with_id]