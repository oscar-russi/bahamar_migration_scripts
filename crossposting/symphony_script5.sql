-- this script pass data from IBS table to IBS_with_id table
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
	[uniq] [int] NOT NULL,
    PRIMARY KEY(
	uniq)
    )
        -- Use a temporary table to hold the batch of rows
        INSERT INTO #TempTable
        SELECT TOP (@BatchSize) *
        FROM Symphony0

        -- Insert the rows into the destination table
        INSERT INTO Symphony_with_id
        SELECT *
        FROM #TempTable;

        -- Delete the rows from the source table

        DELETE Symphony0
		WHERE EXISTS (
    SELECT 1
    FROM #TempTable
    WHERE Symphony0.uniq = #TempTable.uniq
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
    WAITFOR DELAY '00:00:01'
END

-----------------------------------------------------------------------------------------------
