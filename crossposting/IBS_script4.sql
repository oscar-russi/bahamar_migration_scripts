-- this scripts makes three things: 
-- 1) remove IBS table 
-- 2) rename IBS_with_id to IBS
-- 3) rename date processed contraint 

USE [CrossPosting_test2]
GO


drop table IBS0;

drop table IBS;

EXEC sp_rename 'IBS_with_id', 'IBS';

EXEC sp_rename 'DF_IBS_DateProcessed_id', 'DF_IBS_DateProcessed', 'OBJECT';
