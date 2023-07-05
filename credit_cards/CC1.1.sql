USE [CreditCards]
GO


EXEC sp_rename 'stage.FDMS.CLASS_1', 'invoice_number', 'COLUMN';
EXEC sp_rename 'stage.FDMS.CLASS_2', 'native_transaction_status', 'COLUMN';
EXEC sp_rename 'stage.FDMS.CLASS_4', 'payment_method', 'COLUMN';
 
