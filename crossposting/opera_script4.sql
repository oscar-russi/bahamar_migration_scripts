-- this script pass data from Opera table to opera_with_id table

USE [CrossPosting_test2]
GO

-----------------------------------------------------------------------------------------------

DECLARE @BatchSize INT = 5000  -- Adjust as needed
DECLARE @RowsAffected INT = @BatchSize  -- Initialize to enter the loop

WHILE @RowsAffected > 0
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
	CREATE TABLE #TempTable (
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
	[VAT_BRAND] [varchar](50) NULL,
    -- Include other columns from Opera as needed
    PRIMARY KEY(Hotel, TRX_NO)
    )
        -- Use a temporary table to hold the batch of rows
        INSERT INTO #TempTable
        SELECT TOP (@BatchSize) *
        FROM Opera0

        -- Insert the rows into the destination table
        INSERT INTO Opera_with_id
        SELECT *
        FROM #TempTable;

        -- Delete the rows from the source table

        DELETE Opera0
		WHERE EXISTS (
    SELECT 1
    FROM #TempTable
    WHERE opera0.Hotel = #TempTable.Hotel
    AND opera0.TRX_NO = #TempTable.TRX_NO
)


        SET @RowsAffected = @@ROWCOUNT

        -- Commit the transaction
        COMMIT

        -- Drop the temporary table
        DROP TABLE #TempTable
    END TRY
    BEGIN CATCH
        -- Roll back the transaction in case of error
        ROLLBACK
    END CATCH
    -- Optional: wait for a bit before the next batch
    --WAITFOR DELAY '00:00:01'
END

-----------------------------------------------------------------------------------------------
