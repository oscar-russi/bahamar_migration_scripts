-- this scripts makes three things: 
-- 1) remove opera table 
-- 2) rename opera_with_id to opera
-- 3) rename date processed contraint 

USE [CrossPosting_test2]
GO

drop table Opera;

EXEC sp_rename 'Opera_with_id', 'Opera';

EXEC sp_rename 'DF_Opera_DateProcessed_id', 'DF_Opera_DateProcessed', 'OBJECT';
