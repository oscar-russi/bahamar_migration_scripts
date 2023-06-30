CREATE SEQUENCE OperaIDSequence
    START WITH 1
    INCREMENT BY 1;


CREATE SEQUENCE testSequence
    START WITH 1
    INCREMENT BY 1;

	drop table test;
	create table test(
	id varchar(255) primary key,
	column2 varchar(255)
	)
	truncate table test;
	insert into test values ('','some content2'),
	 ('','some content2'),
	 ('','some content3')

	 select * from test

	 select * from idOpera


alter TRIGGER testTrigger
ON test
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @NextValue INT;
    DECLARE @SQL NVARCHAR(MAX);
    -- Get the next value from the sequence
    set @NextValue = (NEXT VALUE FOR dbo.operaIDSequence);
	print @NextValue;
    INSERT INTO test
    SELECT 'op' + CAST((@NextValue) AS VARCHAR(10)), column2
    FROM inserted;
END;

------------------------------------------------------------------

ALTER TRIGGER testTrigger
ON test
INSTEAD OF INSERT
AS
BEGIN
    -- Declare variables
    DECLARE @CustomID VARCHAR(50);
    DECLARE @Column2 VARCHAR(50);

    -- Declare a cursor for the inserted rows
    DECLARE cursor_inserted CURSOR LOCAL FAST_FORWARD FOR
        SELECT column2
        FROM inserted;

    -- Open the cursor
    OPEN cursor_inserted;

    -- Fetch the first row
    FETCH NEXT FROM cursor_inserted INTO @Column2;

    -- Process each inserted row
    WHILE @@FETCH_STATUS = 0
    BEGIN
		DECLARE @NextValue INT;
    set @NextValue = (NEXT VALUE FOR dbo.operaIDSequence);
    INSERT INTO test
    SELECT 'op' + CAST((@NextValue+1) AS VARCHAR(10)), @column2;
        FETCH NEXT FROM cursor_inserted INTO @Column2;
    END;

    -- Close and deallocate the cursor
    CLOSE cursor_inserted;
    DEALLOCATE cursor_inserted;

    -- Insert the rows into the test table
END;

-------------------------------------------

-- Get the current value of the sequence
SELECT  CURRENT_VALUE
FROM sys.sequences
WHERE name = 'testSequence'; -- Replace with your sequence name

DECLARE @NextValue INT;
 DECLARE @SQL NVARCHAR(MAX);
 SELECT @NextValue = NEXT VALUE FOR testSequence;
    SET @SQL = N'ALTER SEQUENCE testSequence RESTART WITH ' + CAST((@NextValue) AS NVARCHAR(50));
    -- Execute the dynamic SQL
    EXEC sp_executesql @SQL;
select NEXT VALUE FOR testSequence;


create table idOpera (id int identity(1,1) primary key)
