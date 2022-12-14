select * into Evs_BI_BalanceSheetHeadingTable_BK from Evs_BI_BalanceSheetHeadingTable
select * into Evs_BI_BalanceSheetLineTable_BK from Evs_BI_BalanceSheetLineTable
select * into Evs_BI_PnLHeadingTable_BK from Evs_BI_PnLHeadingTable
select * into Evs_BI_PnLLineTable_BK from Evs_BI_PnLLineTable


--update  Evs_BI_BalanceSheetHeadingTable set dataareaid='KSA'
--update Evs_BI_BalanceSheetLineTable set dataareaid='KSA'
--update Evs_BI_PnLHeadingTable set dataareaid='KSA'
--update Evs_BI_PnLLineTable set dataareaid='KSA'

select *from Evs_BI_BalanceSheetHeadingTable


select * from  Evs_BI_BalanceSheetHeadingTable_BK
select * from Evs_BI_BalanceSheetLineTable_BK
select * from Evs_BI_PnLHeadingTable_BK
select * from Evs_BI_PnLLineTable_BK

--create record in new company
declare @RecIdMax bigint
select @RecIdMax=isnull(max(recid),0)+1 from Evs_BI_BalanceSheetHeadingTable
insert into Evs_BI_BalanceSheetHeadingTable
select HEADINGID,HEADINGNAME,HAVEDETAIL,ISBOLD,SEQID,HAVECALCULATION,PARTITION,RECID=ROW_NUMBER() over (order by HEADINGID)+@RecIdMax  ,RECVERSION,DATAAREAID='ALG' 
from Evs_BI_BalanceSheetHeadingTable
