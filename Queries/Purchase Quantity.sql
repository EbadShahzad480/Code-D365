Select IT.ItemId ,IT.DATEFINANCIAL ,qty,IT.STATUSRECEIPT,IT.STATUSISSUE from inventTrans IT where IT.STATUSRECEIPT = 2 or IT.STATUSRECEIPT = 3
and IT.ITEMID = 'R-M-010' and IT.DATEFINANCIAL between '1/1/2021' and '12/31/2021'

inner join inventtransorigin ITO on ITO.ItemId=IT.ItemId and 
ITO.RecId=IT.InventTransOrigin 
and ITO.ReferenceCategory = 3  where IT.ITEMID = 'R-M-010' and IT.DATEFINANCIAL between '1/1/2021' and '12/31/2021' 
and IT.STATUSISSUE = 0
group by IT.ITEMID,IT.DATEFINANCIAL

and (IT.STATUSRECEIPT = 2 or IT.STATUSRECEIPT = 3) 




 select * from inventtrans where (STATUSISSUE = 1 or STATUSISSUE = 2)
  and dataareaid='ksa' and ITEMID='R-M-010' 

select sum(QUANTITY) from Evs_BI_AllQtyUsedInProduction_RM where itemid='R-M-010' and trdate between '1/1/2021' and '12/31/2021' 

--purchase Amoutn
select ItemId,sum(Quantity) from evs_BI_AllPurchases  where itemid='R-M-010' and TrDate  between '1/1/2021' and '12/31/2021' group by ITEMID
 
 Select REFERENCEID,sum(Qty) from inventTrans  
            inner join inventtransorigin on inventtransorigin.ItemId=inventTrans.ItemId 
			and inventtransorigin.RecId=inventTrans.InventTransOrigin
            and inventtransorigin.ReferenceCategory = 8   
			and inventtransorigin.DATAAREAID=inventTrans.DATAAREAID
			where inventTrans.itemid='R-M-010' and inventTrans.DATAAREAID='ksa'
			and DATEFINANCIAL between '3/1/2021' and '3/31/2021' 
			 group by REFERENCEID
