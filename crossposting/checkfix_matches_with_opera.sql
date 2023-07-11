USE [CrossPosting]
GO

with q1 as (
SELECT
    o.Id,
	o.GUEST_FULL_NAME,
	o.TRX_DESC,
	o.MARKET_CODE,
	o.BUSINESS_DATE AS BUSINESS_FORMAT_DATE,
	o.BUSINESS_TIME,
	o.REFERENCE,
	o.TRX_NO,
	o.CASHIER_DEBIT,
	o.CASHIER_CREDIT,
	o.ROOM,
	o.CREDIT_CARD_SUPPLEMENT,
	o.CURRENCY1,
	o.TRX_CODE,
	o.[USER_NAME],
	COALESCE(fix.CHECK_NUMBER, o.CHECK_NUMBER) AS CHECK_NUMBER,
	o.Hotel AS TRX_DESC2,
	o.TRX_CODE AS CODE,
	CONVERT(VARCHAR(2), 0) AS VAT,
	mt.TrxDesc AS [CONCATENATE],
	o.CASHIER_DEBIT AS AMOUNT,
	o.Hotel AS HOTEL,
	CASE
		WHEN o.Hotel = 'CTF' AND o.TRX_CODE IN ('33608001', '74508001') THEN o.VAT_BRAND
		ELSE mt.Department 
	END AS BRAND,
	CASE
		WHEN o.[USER_NAME] = 'Opera-IFC' THEN 'Automatic'
		ELSE 'Manual'
	END AS INPUT,
	CASE
		WHEN o.Hotel = 'CTF' AND o.GUEST_FULL_NAME LIKE 'GH %' THEN 'GH'
		WHEN o.Hotel = 'CTF' AND o.GUEST_FULL_NAME LIKE 'RSW %' THEN 'RSW'
		WHEN o.Hotel = 'CTF' AND o.GUEST_FULL_NAME LIKE 'SLS %' THEN 'SLS'
		ELSE NULL
	END AS CTF_Hotel,
	mt.OriginatingHotel AS ORIGINATING_HOTEL,
	mt.DataSource AS [DATA_SOURCE],
	o.INSERT_DATE,
	o.CHECK_NUMBER AS ORIGINAL_CHECK_NUMBER
FROM Opera AS o
JOIN udv_MappingTable AS mt ON
	o.Hotel = mt.Hotel AND
	o.TRX_CODE = mt.TrxCode
LEFT JOIN Opera_Fix AS fix ON
	o.TRX_NO = fix.TRX_NO
	)
select q1.Id, count(*) as total from q1
right join Check_Fix as cf ON
q1.BRAND = cf.Department AND
	q1.CHECK_NUMBER = cf.CHECK_NUMBER
	group by q1.Id
	 order by total desc

	 --24339
	 select count(*) from Check_Fix