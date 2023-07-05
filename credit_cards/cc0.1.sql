USE [CreditCards]
GO


EXEC sp_rename 'FDMS.CLASS_1', 'invoice_number', 'COLUMN';
EXEC sp_rename 'FDMS.CLASS_2', 'native_transaction_status', 'COLUMN';
EXEC sp_rename 'FDMS.CLASS_4', 'payment_method', 'COLUMN';
 

 select DIsTINCT SOURCE, SUBMIT_DATE from udv_CreditCards
  where SUBMIT_DATE='03-01-2023'