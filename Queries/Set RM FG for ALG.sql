--step 1
select * from Evs_BI_RawMaterialBalanceReportSetup where DATAAREAID='ksa' and PACKAGINGGROUPID<>''
select * from Evs_BI_RawMaterialBalanceReportSetup where DATAAREAID='alg' and PACKAGINGGROUPID<>''


--step 2
select * from Evs_BI_InventPackagingGroup 
select * from evs_BI_InventItemGroup


--step 3,4,5,6
select * from evs_BI_AgingMonthSetup
select * from evs_BI_AllPurchases
select * from evs_BI_AllSales
select * from Evs_BI_AllQtyUsedInProduction
select * from evs_BI_AllQtyUsedInProduction_RM
select * from evs_BI_AllBOMQtyUsedInProduction
select * from inventPackagingGroup
select * from evs_BI_AgingMonthSetup
select * from Evs_BI_InventPackagingGroup

--update packing group id
select 1 from evs_BI_RawMaterialBalanceReport  where DATAAREAID='alg'
--197,715
select 1 from evs_BI_RawMaterialBalanceReport  where DATAAREAID='ksa'
select  * from Evs_BI_RawMaterialBalanceReportSetup where DATAAREAID='ksa' and PACKAGINGGROUPID<>''
select * from evs_BI_RawMaterialBalanceReport where DATAAREAID='ksa' and PACKAGINGGROUPID<>''
select * from evs_BI_FinishGoodMterialBalanceReport  where DATAAREAID='ksa'



-- bi refresh issue
select * from Evs_BI_InventPackagingGroup where name like 'Sodium%'
select dataAreaId,InventUnit,Name,ItemGroupId from evs_BI_InventItemGroup where name like 'Sodium Silicate Solution%' and DATAAREAID='ksa'
group by dataAreaId,InventUnit,Name,ItemGroupId

