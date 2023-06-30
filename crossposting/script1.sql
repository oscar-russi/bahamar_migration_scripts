--this script creates a second Opera table to migrate all the information of Opera, but adding an Id
USE [CrossPosting_test2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opera_with_id](
   [Id] varchar(255) primary key,
	[Hotel] [varchar](255) NOT NULL,
	[TRX_NO] [int] NOT NULL,
	[IS_INTERNAL_YN] [varchar](255) NULL,
	[INTERNAL_DEBIT] [decimal](18, 2) NULL,
	[INTERNAL_CREDIT] [decimal](18, 2) NULL,
	[FIRST] [varchar](255) NULL,
	[FIRST_DEBIT] [decimal](18, 2) NULL,
	[FIRST_CREDIT] [decimal](18, 2) NULL,
	[SECOND] [varchar](255) NULL,
	[SECOND_DEBIT] [decimal](18, 2) NULL,
	[SECOND_CREDIT] [decimal](18, 2) NULL,
	[THIRD] [varchar](255) NULL,
	[THIRD_DEBIT] [decimal](18, 2) NULL,
	[THIRD_CREDIT] [decimal](18, 2) NULL,
	[EXP_DATE] [varchar](255) NULL,
	[RECEIPT_NO] [varchar](255) NULL,
	[GUEST_FULL_NAME] [varchar](255) NULL,
	[TARGET_RESORT] [varchar](255) NULL,
	[TRX_DESC] [varchar](255) NULL,
	[MARKET_CODE] [varchar](255) NULL,
	[BUSINESS_FORMAT_DATE] [varchar](255) NULL,
	[BUSINESS_TIME] [time](1) NULL,
	[BUSINESS_DATE] [date] NULL,
	[REFERENCE] [varchar](1000) NULL,
	[CASHIER_DEBIT] [decimal](18, 2) NULL,
	[CASHIER_CREDIT] [decimal](18, 2) NULL,
	[ROOM] [varchar](255) NULL,
	[CREDIT_CARD_SUPPLEMENT] [varchar](2000) NULL,
	[CURRENCY1] [varchar](255) NULL,
	[TRX_CODE] [varchar](255) NULL,
	[CASHIER_ID] [int] NULL,
	[REMARK] [varchar](2000) NULL,
	[INSERT_USER] [int] NULL,
	[INSERT_DATE] [date] NULL,
	[CHEQUE_NUMBER] [varchar](255) NULL,
	[ROOM_CLASS] [varchar](255) NULL,
	[CC_CODE] [varchar](255) NULL,
	[CASHIER_NAME] [varchar](255) NULL,
	[USER_NAME] [varchar](255) NULL,
	[DEP_NET_TAX_AMT] [decimal](18, 2) NULL,
	[DEPOSIT_DEBIT] [decimal](18, 2) NULL,
	[CASH_ID_USER_NAME] [varchar](255) NULL,
	[PRINT_CASHIER_DEBIT] [decimal](18, 2) NULL,
	[PRINT_CASHIER_CREDIT] [decimal](18, 2) NULL,
	[Filename] [varchar](255) NULL,
	[DateProcessed] [datetime] NULL,
	[CHECK_NUMBER] [varchar](50) NULL,
	[VAT_BRAND] [varchar](50) NULL)
GO

ALTER TABLE [dbo].[Opera_with_id] ADD  CONSTRAINT [DF_Opera_DateProcessed_id]  DEFAULT (getdate()) FOR [DateProcessed]
GO

