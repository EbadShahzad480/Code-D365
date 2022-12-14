select TRANSDATE,COSTGROUPID,RESOURCE_,REALCONSUMP TotalFG ,
Total_EC_WT=(Select Sum(REALCONSUMP) from ProdCalcTrans pcti where pcti.COLLECTREFPRODID=pct.COLLECTREFPRODID and pcti.COSTGROUPID in('EC','WC') and pcti.DATAAREAID=pct.DATAAREAID)


from	ProdCalcTrans pct (nolock)
where	pct.dataareaid='ksa' 
and		pct.COSTGROUPID='FG'
and		pct.REALCONSUMP<>0
and     year(pct.TRANSDATE)<>1900
and		pct.COLLECTREFPRODID='MO-000001'

select * from	ProdCalcTrans pct (nolock) where	pct.dataareaid='ksa'  and		pct.COLLECTREFPRODID='MO-000001'






--select * from EVS_BI_ITEMINFOTABLE where ITEMID in(select RESOURCE_ from ProdCalcTrans where dataareaid='ksa' and COLLECTREFPRODID='MO-000001')