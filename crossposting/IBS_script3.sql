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
	[DateProcessed] [datetime] NOT NULL,
    PRIMARY KEY(
	[Outlet],
	[Invoice],
	[CustNumber],
	[ReferenceNumber],
	[Verification])
    )
        -- Use a temporary table to hold the batch of rows
        INSERT INTO #TempTable
        SELECT TOP (@BatchSize) *
        FROM IBS0

        -- Insert the rows into the destination table
        INSERT INTO IBS_with_id
        SELECT *
        FROM #TempTable;

        -- Delete the rows from the source table

        DELETE IBS0
		WHERE EXISTS (
    SELECT TOP 1 1
    FROM #TempTable
    WHERE IBS0.[Outlet] = #TempTable.[Outlet]
    AND IBS0.[Invoice] = #TempTable.[Invoice]
	AND IBS0.[CustNumber] = #TempTable.[CustNumber]
	AND IBS0.[ReferenceNumber] = #TempTable.[ReferenceNumber]
	AND IBS0.[Verification] = #TempTable.[Verification]
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
END

-----------------------------------------------------------------------------------------------
