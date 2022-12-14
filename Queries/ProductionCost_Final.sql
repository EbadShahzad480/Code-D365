/*
Production Qty. 		 Sales Qty. 		 Raw Material Total Cost 	
 Actual 	 Budget 	 Actual 	 Budget 	 Raw Materials 	 Fuel & Elec. 
 */

 select RAWMATERIALQTY ,* from  EVS_BI_ProductCostingTable where ITEMGROUPID = '30230'
 select * from Evs_BI_budgetTmpBalancesActualsACandIG where ITEMGROUPID = '30230'

 select * from   EVS_BI_ProductCostingTB 
select * from   Evs_BI_ElectAndWater 
select * from   Evs_BI_budgetTmpBalancesActualsACandIG 

--Production Actual 
update  rep set rep.PRODUCTIONQTY_ACTUAL=bud.LEDGERAMOUNT
--select 1 
from EVS_BI_ProductCostingTable rep
inner join Evs_BI_budgetTmpBalancesActualsACandIG bud (nolock) on 
	bud.ITEMGROUPID=rep.ITEMGROUPID
and bud.DATAAREAID=rep.DATAAREAID
and bud.STARTDATE=rep.FROMDATE
and bud.ENDDATE=rep.TODATE
and bud.glac like 'X-Production%'

--Production Budget 
update  rep set rep.PRODUCTIONQTY_BUDGET=bud.DEBITLEDGERAMOUNT
--select 1 
from EVS_BI_ProductCostingTable rep
inner join Evs_BI_budgetTmpBalancesActualsACandIG bud (nolock) on 
	bud.ITEMGROUPID=rep.ITEMGROUPID
and bud.DATAAREAID=rep.DATAAREAID
and bud.STARTDATE=rep.FROMDATE
and bud.ENDDATE=rep.TODATE
and bud.glac like 'X-Production%'

--Sales Qty Actual
update  rep set rep.PRODUCTIONQTY_BUDGET=bud.LEDGERAMOUNT
--select 1 
from EVS_BI_ProductCostingTable rep
inner join Evs_BI_budgetTmpBalancesActualsACandIG bud (nolock) on 
	bud.ITEMGROUPID=rep.ITEMGROUPID
and bud.DATAAREAID=rep.DATAAREAID
and bud.STARTDATE=rep.FROMDATE
and bud.ENDDATE=rep.TODATE
and bud.glac like 'X-Sales%'

--Sales Qty Budget
update  rep set rep.PRODUCTIONQTY_BUDGET=bud.DEBITLEDGERAMOUNT
--select 1 
from EVS_BI_ProductCostingTable rep
inner join Evs_BI_budgetTmpBalancesActualsACandIG bud (nolock) on 
	bud.ITEMGROUPID=rep.ITEMGROUPID
and bud.DATAAREAID=rep.DATAAREAID
and bud.STARTDATE=rep.FROMDATE
and bud.ENDDATE=rep.TODATE
and bud.glac like 'X-Sales%'

 --Raw Material
 update  rep set rep.RawMaterialQTY = pcr.QUANTITY
--select 1 
from EVS_BI_ProductCostingTable rep
inner join EVS_BI_ProductCostingRawMaterial pcr (nolock) on 
	pcr.ITEMGROUPID=rep.ITEMGROUPID
and pcr.DATAAREAID=rep.DATAAREAID
and pcr.FROMDATE=rep.FROMDATE
and pcr.TODATE=rep.TODATE


 --Fuel & Elec.
  update  rep set rep.RawMaterialQTY = eaw.TOTAL_EC_WT
--select 1 
from EVS_BI_ProductCostingTable rep
inner join Evs_BI_ElectAndWater eaw (nolock) on 
	eaw.ITEMGROUPID=rep.ITEMGROUPID
and eaw.DATAAREAID=rep.DATAAREAID
and eaw.FROMDATE=rep.FROMDATE
and eaw.TODATE=rep.TODATE

--Production Cost

--Total_Depreciation 
  update  rep set rep.RawMaterialQTY = pct.TBVALUE
--select 1 
from EVS_BI_ProductCostingTable rep
inner join EVS_BI_ProductCostingTB pct (nolock) on 
	pct.ITEMGROUPID=rep.ITEMGROUPID
and pct.DATAAREAID=rep.DATAAREAID
and pct.FROMDATE=rep.FROMDATE
and pct.TODATE=rep.TODATE
and pct.GLAC = '5110201'

--Total_LabourCost_Direct 
  update  rep set rep.RawMaterialQTY = pct.TBVALUE
--select 1 
from EVS_BI_ProductCostingTable rep
inner join EVS_BI_ProductCostingTB pct (nolock) on 
	pct.ITEMGROUPID=rep.ITEMGROUPID
and pct.DATAAREAID=rep.DATAAREAID
and pct.FROMDATE=rep.FROMDATE
and pct.TODATE=rep.TODATE
and pct.GLAC = '5110101'

-- Total_LabourCost_InDirect 
  update  rep set rep.RawMaterialQTY = pct.TBVALUE
--select 1 
from EVS_BI_ProductCostingTable rep
inner join EVS_BI_ProductCostingTB pct (nolock) on 
	pct.ITEMGROUPID=rep.ITEMGROUPID
and pct.DATAAREAID=rep.DATAAREAID
and pct.FROMDATE=rep.FROMDATE
and pct.TODATE=rep.TODATE
and pct.GLAC = '5110102'

--  Total_IndExpOtherCash
  update  rep set rep.RawMaterialQTY = pct.TBVALUE
--select 1 
from EVS_BI_ProductCostingTable rep
inner join EVS_BI_ProductCostingTB pct (nolock) on 
	pct.ITEMGROUPID=rep.ITEMGROUPID
and pct.DATAAREAID=rep.DATAAREAID
and pct.FROMDATE=rep.FROMDATE
and pct.TODATE=rep.TODATE
and pct.GLAC = '5110401'

--Total_IndExpOtherDepreciation
  update  rep set rep.RawMaterialQTY = pct.TBVALUE
--select 1 
from EVS_BI_ProductCostingTable rep
inner join EVS_BI_ProductCostingTB pct (nolock) on 
	pct.ITEMGROUPID=rep.ITEMGROUPID
and pct.DATAAREAID=rep.DATAAREAID
and pct.FROMDATE=rep.FROMDATE
and pct.TODATE=rep.TODATE
and pct.GLAC = '5110202'

