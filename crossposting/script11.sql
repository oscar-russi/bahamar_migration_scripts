-- this scripts makes three things: 
-- 1) remove Symphony table 
-- 2) rename Symphony_with_id to Symphony
-- 3) rename date processed contraint 
-- 4) delete uniq column from Symphony

USE [CrossPosting_test2]
GO

drop table Symphony;

EXEC sp_rename 'Symphony_with_id', 'Symphony';

EXEC sp_rename 'DF__Symphony__DatePr__1CBC4616_id', 'DF__Symphony__DatePr__1CBC4616', 'OBJECT';

alter table Symphony
drop column uniq;

