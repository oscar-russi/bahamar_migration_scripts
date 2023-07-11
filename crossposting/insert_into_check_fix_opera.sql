/****** Script for SelectTopNRows command from SSMS  ******/
with q1 as(
SELECT  
      o.Id,
      c.[CHECK_NUMBER]
      ,c.[BRAND]
	  ,c.Comments
	  ,c.Status1
	  ,c.Status2
	  ,c.Status3
	  ,count(*) total
  FROM [CrossPosting].[dbo].[udv_CTF_Final] c
  inner join Opera o
  on c.HOTEL=o.Hotel
  and c.TRX_NO=o.TRX_NO
  where Comments is not null
  group by  o.Id,
  c.[CHECK_NUMBER]
      ,c.[BRAND]
	   ,c.Comments
	   ,c.Status1
	  ,c.Status2
	  ,c.Status3
  )
  insert into dbo.[Check_Fix_Opera]
  select  
  id
  ,Comments
  ,Status1
	  ,Status2
	  ,Status3
	  from q1

	  --select * from dbo.[Check_Fix_Opera]