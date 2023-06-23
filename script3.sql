-- this scripts makes two things: remove opera table and rename opera_with_id to opera

USE [CrossPosting_test2]
GO

drop table Opera;

EXEC sp_rename 'Opera_with_id', 'Opera';
