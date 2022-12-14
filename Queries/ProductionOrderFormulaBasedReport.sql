--Report Format

--header finish good
SELECT  pt.DATAAREAID,year(pt.FINISHEDDATE)YearNo,month(pt.FINISHEDDATE)MonthNo,igt.ITEMGROUPID [Item Group ID] ,img.[NAME] [Item Group Name],PACKAGINGGROUPID='',[PACKAGING GROUP NAME]='', Sum(QTYCALC) [Production Quantity] ,QTY=0 
FROM ProdTable pt  
inner join INVENTITEMGROUPITEM igt on igt.ITEMID=pt.ITEMID and igt.ITEMDATAAREAID=pt.DATAAREAID and igt.ITEMGROUPDATAAREAID=pt.DATAAREAID
inner join INVENTITEMGROUP img on img.ITEMGROUPID=igt.ITEMGROUPID and img.DATAAREAID=igt.ITEMGROUPDATAAREAID 
where  pt.PRODSTATUS=7 
group by pt.DATAAREAID,year(pt.FINISHEDDATE),month(pt.FINISHEDDATE),igt.ITEMGROUPID ,img.[NAME]

Union ALL

select pt.DATAAREAID,year(pt.FINISHEDDATE)YearNo,month(pt.FINISHEDDATE)MonthNo,  igt.ITEMGROUPID [Item Group ID],img.[NAME] [Item Group Name],itt.PACKAGINGGROUPID,isnull(ipg.NAME,'Not Defined')[PACKAGING GROUP NAME] , [Production Quantity]=0,
sum(isnull(pb.QTYBOMCALC,0)) QTY 
from INVENTTABLE itt 
left outer join InventPackagingGroup ipg on itt.PACKAGINGGROUPID=ipg.PACKAGINGGROUPID and itt.DATAAREAID=ipg.DATAAREAID
left outer join ProdBOM pb  on pb.ITEMID=itt.ITEMID  and pb.DATAAREAID=itt.DATAAREAID
left outer join ProdTable pt  on pt.DATAAREAID=pb.DATAAREAID and pt.PRODID=pb.PRODID
inner join INVENTITEMGROUPITEM igt on igt.ITEMID=pt.ITEMID and igt.ITEMDATAAREAID=pt.DATAAREAID and igt.ITEMGROUPDATAAREAID=pt.DATAAREAID
inner join INVENTITEMGROUP img on img.ITEMGROUPID=igt.ITEMGROUPID and img.DATAAREAID=igt.ITEMGROUPDATAAREAID 
where  pt.PRODSTATUS=7 


group by pt.DATAAREAID,year(pt.FINISHEDDATE),month(pt.FINISHEDDATE), igt.ITEMGROUPID,img.[NAME],itt.PACKAGINGGROUPID,isnull(ipg.NAME,'Not Defined')

order by 1,2,3,4


select newid()

/*
--cross tab
select * from _ProductionReviewHeader where YearNo=2022 and MonthNo=1 and [Item Group ID]='10080'
select * from _ProductionReviewLine where YearNo=2022 and MonthNo=1 and [Item Group ID]='10080'
select * from InventPackagingGroup

--cross tab
create table _ProductionReviewCrossTable
(
C1_Name			char(65),
C1_Value		real,
C2_Name			char(65),
C2_Value		real,
C3_Name			char(65),
C3_Value		real,
C4_Name			char(65),
C4_Value		real,
C5_Name			char(65),
C5_Value		real,
C6_Name			char(65),
C6_Value		real,
C7_Name			char(65),
C7_Value		real,
C8_Name			char(65),
C8_Value		real,
C9_Name			char(65),
C9_Value		real,
C10_Name			char(65),
C10_Value		real,
C11_Name			char(65),
C11_Value		real,
C12_Name			char(65),
C12_Value		real,
C13_Name			char(65),
C13_Value		real,
C14_Name			char(65),
C14_Value		real,
C15_Name			char(65),
C15_Value		real,
C16_Name			char(65),
C16_Value		real,
C17_Name			char(65),
C17_Value		real,
C18_Name			char(65),
C18_Value		real,
C19_Name			char(65),
C19_Value		real,
C20_Name			char(65),
C20_Value		real,
C21_Name			char(65),
C21_Value		real,
C22_Name			char(65),
C23_Value		real,
C23_Name			char(65),
C24_Value		real,
C24_Name			char(65),
C25_Value		real,
C26_Name			char(65),
C27_Value		real,
C28_Name			char(65),
C19_Value		real,
C19_Name			char(65),
C19_Value		real,
C19_Name			char(65),
C19_Value		real,
C19_Name			char(65),
C19_Value		real,

)


/*

--header finish good
SELECT  pt.PRODID, igt.ITEMGROUPID,img.NAME,  pt.ITEMID, idd.INVENTLOCATIONID,idd.INVENTSITEID,  pt.PRODSTATUS,QTYSCHED,QTYSTUP,QTYCALC  FROM ProdTable pt  
inner JOIN  InventDim idd ON Pt.InventDimId = Idd.inventDimId
inner join INVENTITEMGROUPITEM igt on igt.ITEMID=pt.ITEMID and igt.ITEMDATAAREAID=pt.DATAAREAID and igt.ITEMGROUPDATAAREAID=pt.DATAAREAID
inner join INVENTITEMGROUP img on img.ITEMGROUPID=igt.ITEMGROUPID and img.DATAAREAID=igt.ITEMGROUPDATAAREAID 
where pt.DATAAREAID='ALG' and pt.PRODID='MO-000001' and pt.PRODSTATUS=7

--line raw material
select pb.PRODID, itt.PACKAGINGGROUPID,isnull(ipg.NAME,'Not Defined')RawMetGroup ,itt.ITEMID, INVENTLOCATIONID='',INVENTSITEID='',pb.QTYBOMCALC from INVENTTABLE itt 
left outer join InventPackagingGroup ipg on itt.PACKAGINGGROUPID=ipg.PACKAGINGGROUPID and itt.DATAAREAID=ipg.DATAAREAID
left outer join ProdBOM pb  on pb.ITEMID=itt.ITEMID  and pb.DATAAREAID=itt.DATAAREAID
left outer  JOIN  InventDim idd ON Pb.InventDimId = Idd.inventDimId

where pb.DATAAREAID='ALG' and pb.PRODID='MO-000001' 

*/



*/