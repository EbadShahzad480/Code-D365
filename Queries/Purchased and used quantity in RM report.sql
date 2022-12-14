--verifying Used Amount
select sum(Quantity) from Evs_BI_AllPurchases  where itemid='R-M-010' and DATAAREAID='ksa' 
and TRDATE  between '1/1/2022' and '9/30/2022' 

--verifying purchased Amount
select sum(QUANTITY) from Evs_BI_AllQtyUsedInProduction_RM where itemid='R-M-010' and DATAAREAID='ksa' 
and trdate between '1/1/2022' and '9/30/2022'


--Purchased Main Table
Select IT.ItemId  ,sum(IT.qty) ,ITO.ReferenceCategory from inventTrans IT 
inner join inventtransorigin ITO on ITO.ItemId=IT.ItemId and 
ITO.RecId=IT.InventTransOrigin 
and ITO.ReferenceCategory = 3 where IT.ITEMID = 'R-M-010' and IT.DATEFINANCIAL between '1/1/2022' and '9/30/2022'
group by IT.ItemId ,ITO.ReferenceCategory

--Used Main Table
Select IT.ItemId  ,sum(IT.qty) ,ITO.ReferenceCategory from inventTrans IT 
inner join inventtransorigin ITO on ITO.ItemId=IT.ItemId and 
ITO.RecId=IT.InventTransOrigin 
and ITO.ReferenceCategory = 8 where IT.ITEMID = 'R-M-010' and IT.DATEFINANCIAL between '1/1/2022' and '9/30/2022'
group by IT.ItemId ,ITO.ReferenceCategory
