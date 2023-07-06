--CREATE TRIGGER OperaTrigger
--ON Opera_with_id
--INSTEAD OF INSERT
--AS
--BEGIN
    -- Declare variables
Use CrossPosting_test2;
    DECLARE @Hotel [varchar](255);
	DECLARE @TRX_NO [int];
	DECLARE @IS_INTERNAL_YN varchar(255);
	DECLARE @INTERNAL_DEBIT decimal(18, 2);
	declare @INTERNAL_CREDIT decimal(18, 2);
	declare @FIRST [varchar](255);
	declare @FIRST_DEBIT decimal(18, 2);
	declare @FIRST_CREDIT decimal(18, 2);
	declare @SECOND varchar(255);
	declare @SECOND_DEBIT decimal(18, 2);
	declare @SECOND_CREDIT [decimal](18, 2);
	declare @THIRD [varchar](255);
	declare @THIRD_DEBIT [decimal](18, 2);
	declare @THIRD_CREDIT [decimal](18, 2);
	declare @EXP_DATE [varchar](255);
	declare @RECEIPT_NO [varchar](255);
	declare @GUEST_FULL_NAME [varchar](255);
	declare @TARGET_RESORT [varchar](255);
	declare @TRX_DESC [varchar](255);
	declare @MARKET_CODE [varchar](255);
	declare @BUSINESS_FORMAT_DATE [varchar](255);
	declare @BUSINESS_TIME [time](1);
	declare @BUSINESS_DATE [date];
	declare @REFERENCE [varchar](1000);
	declare @CASHIER_DEBIT [decimal](18, 2);
	declare @CASHIER_CREDIT [decimal](18, 2);
	declare @ROOM [varchar](255);
	declare @CREDIT_CARD_SUPPLEMENT [varchar](2000);
	declare @CURRENCY1 [varchar](255);
	declare @TRX_CODE [varchar](255);
	declare @CASHIER_ID [int];
	declare @REMARK [varchar](2000);
	declare @INSERT_USER [int];
	declare @INSERT_DATE [date];
	declare @CHEQUE_NUMBER [varchar](255);
	declare @ROOM_CLASS [varchar](255);
	declare @CC_CODE [varchar](255);
	declare @CASHIER_NAME [varchar](255);
	declare @USER_NAME [varchar](255);
	declare @DEP_NET_TAX_AMT [decimal](18, 2);
	declare @DEPOSIT_DEBIT [decimal](18, 2);
	declare @CASH_ID_USER_NAME [varchar](255);
	declare @PRINT_CASHIER_DEBIT [decimal](18, 2);
	declare @PRINT_CASHIER_CREDIT [decimal](18, 2);
	declare @Filename [varchar](255);
	declare @DateProcessed [datetime];
	declare @CHECK_NUMBER [varchar](50);
	declare @VAT_BRAND [varchar](50);
    -- Declare a cursor for the inserted rows
    DECLARE cursor_inserted CURSOR LOCAL FAST_FORWARD FOR
        SELECT *
        FROM Opera;

    -- Open the cursor
    OPEN cursor_inserted;

    -- Fetch the first row
    FETCH NEXT FROM cursor_inserted INTO @Hotel 
	,@TRX_NO 
	,@IS_INTERNAL_YN 
	,@INTERNAL_DEBIT
	,@INTERNAL_CREDIT
	,@FIRST 
	,@FIRST_DEBIT
	,@FIRST_CREDIT
	,@SECOND 
	,@SECOND_DEBIT
	,@SECOND_CREDIT 
	,@THIRD 
	,@THIRD_DEBIT 
	,@THIRD_CREDIT 
	,@EXP_DATE 
	,@RECEIPT_NO 
	,@GUEST_FULL_NAME 
	,@TARGET_RESORT 
	,@TRX_DESC 
	,@MARKET_CODE 
	,@BUSINESS_FORMAT_DATE 
	,@BUSINESS_TIME 
	,@BUSINESS_DATE 
	,@REFERENCE 
	,@CASHIER_DEBIT 
	,@CASHIER_CREDIT 
	,@ROOM 
	,@CREDIT_CARD_SUPPLEMENT 
	,@CURRENCY1 
	,@TRX_CODE 
	,@CASHIER_ID 
	,@REMARK 
	,@INSERT_USER 
	,@INSERT_DATE 
	,@CHEQUE_NUMBER 
	,@ROOM_CLASS 
	,@CC_CODE 
	,@CASHIER_NAME 
	,@USER_NAME 
	,@DEP_NET_TAX_AMT 
	,@DEPOSIT_DEBIT 
	,@CASH_ID_USER_NAME 
	,@PRINT_CASHIER_DEBIT 
	,@PRINT_CASHIER_CREDIT 
	,@Filename 
	,@DateProcessed 
	,@CHECK_NUMBER 
	,@VAT_BRAND;

    -- Process each inserted row
    WHILE @@FETCH_STATUS = 0
    BEGIN
    INSERT INTO Opera_with_id
	 select 
	 @Hotel
	 ,@TRX_NO 
	,@IS_INTERNAL_YN 
	,@INTERNAL_DEBIT
	,@INTERNAL_CREDIT
	,@FIRST 
	,@FIRST_DEBIT
	,@FIRST_CREDIT
	,@SECOND 
	,@SECOND_DEBIT
	,@SECOND_CREDIT 
	,@THIRD 
	,@THIRD_DEBIT 
	,@THIRD_CREDIT 
	,@EXP_DATE 
	,@RECEIPT_NO 
	,@GUEST_FULL_NAME 
	,@TARGET_RESORT 
	,@TRX_DESC 
	,@MARKET_CODE 
	,@BUSINESS_FORMAT_DATE 
	,@BUSINESS_TIME 
	,@BUSINESS_DATE 
	,@REFERENCE 
	,@CASHIER_DEBIT 
	,@CASHIER_CREDIT 
	,@ROOM 
	,@CREDIT_CARD_SUPPLEMENT 
	,@CURRENCY1 
	,@TRX_CODE 
	,@CASHIER_ID 
	,@REMARK 
	,@INSERT_USER 
	,@INSERT_DATE 
	,@CHEQUE_NUMBER 
	,@ROOM_CLASS 
	,@CC_CODE 
	,@CASHIER_NAME 
	,@USER_NAME 
	,@DEP_NET_TAX_AMT 
	,@DEPOSIT_DEBIT 
	,@CASH_ID_USER_NAME 
	,@PRINT_CASHIER_DEBIT 
	,@PRINT_CASHIER_CREDIT 
	,@Filename 
	,@DateProcessed 
	,@CHECK_NUMBER 
	,@VAT_BRAND;
	delete from Opera where Hotel=@Hotel and TRX_NO=@TRX_NO;
        FETCH NEXT FROM cursor_inserted INTO @Hotel 
	,@TRX_NO 
	,@IS_INTERNAL_YN 
	,@INTERNAL_DEBIT
	,@INTERNAL_CREDIT
	,@FIRST 
	,@FIRST_DEBIT
	,@FIRST_CREDIT
	,@SECOND 
	,@SECOND_DEBIT
	,@SECOND_CREDIT 
	,@THIRD 
	,@THIRD_DEBIT 
	,@THIRD_CREDIT 
	,@EXP_DATE 
	,@RECEIPT_NO 
	,@GUEST_FULL_NAME 
	,@TARGET_RESORT 
	,@TRX_DESC 
	,@MARKET_CODE 
	,@BUSINESS_FORMAT_DATE 
	,@BUSINESS_TIME 
	,@BUSINESS_DATE 
	,@REFERENCE 
	,@CASHIER_DEBIT 
	,@CASHIER_CREDIT 
	,@ROOM 
	,@CREDIT_CARD_SUPPLEMENT 
	,@CURRENCY1 
	,@TRX_CODE 
	,@CASHIER_ID 
	,@REMARK 
	,@INSERT_USER 
	,@INSERT_DATE 
	,@CHEQUE_NUMBER 
	,@ROOM_CLASS 
	,@CC_CODE 
	,@CASHIER_NAME 
	,@USER_NAME 
	,@DEP_NET_TAX_AMT 
	,@DEPOSIT_DEBIT 
	,@CASH_ID_USER_NAME 
	,@PRINT_CASHIER_DEBIT 
	,@PRINT_CASHIER_CREDIT 
	,@Filename 
	,@DateProcessed 
	,@CHECK_NUMBER 
	,@VAT_BRAND;

    END;

    -- Close and deallocate the cursor
    CLOSE cursor_inserted;
    DEALLOCATE cursor_inserted;

    -- Insert the rows into the test table
--END;