  declare @FirsrDateOfMonth Datetime
         declare @LastDateOfMonth Datetime
        
        declare  @day_number Int =1
        declare  @month_number Int=1
        declare  @Years_Number Int=1
        

        
        declare  @Year_NumPrev int =2022


		truncate table EVS_BI_ProductCostingRawMaterial

       while (@month_number<=12)
	   begin


	   set @FirsrDateOfMonth =   cast(@Month_number as char(3)) +'/'+cast(@Day_number as char(3))+'/'+cast(@Year_NumPrev as char(4))
				set @LastDateOfMonth=EOMONTH(@FirsrDateOfMonth)
				print @FirsrDateOfMonth
				print @LastDateOfMonth
 
			declare @Partition bigint 
         ,@RecID bigint=isnull((select max(recid) from EVS_BI_ProductCostingRawMaterial),0)+1  
         select @Partition=PARTITION from DATAAREA where ID=''
         insert into EVS_BI_ProductCostingRawMaterial(FROMDATE,TODATE,ITEMGROUPID,QUANTITY,DATAAREAID,PARTITION,RECID,RECVERSION)        
       
         select @FirsrDateOfMonth,@LastDateOfMonth,ITEMGROUPID, (ISNULL(QTY,0))QTY, 
        '',@Partition,ROW_NUMBER ( ) Over (order by  ITEMGROUPID)+@RecID,1        
         from (
         select TargetITEMGROUPID ITEMGROUPID,sum(qty) QTY
         from
         (
         select  EVS_BI_ITEMINFOTABLE.ITEMGROUPID SourceITEMGROUPID,EVS_BI_ITEMINFOTABLE_1.ITEMGROUPID TargetITEMGROUPID,
         sum(ProdCalcTrans.qty) qty FROM ProdCalcTrans
         inner join prodTable on ProdCalcTrans.CollectRefProdId = prodTable.ProdId and ProdCalcTrans.DATAAREAID=prodTable.DATAAREAID
         and ProdCalcTrans.CollectRefProdId = prodTable.CollectRefProdId and ((prodTable.ProdStatus = 7))
         inner join EVS_BI_ITEMINFOTABLE  on EVS_BI_ITEMINFOTABLE.ITEMID=ProdCalcTrans.RESOURCE_ and EVS_BI_ITEMINFOTABLE.DATAAREAID=ProdCalcTrans.DATAAREAID
         and   EVS_BI_ITEMINFOTABLE.COSTGROUPID='FG-Bulk'
            
         inner join ProdCalcTrans ProdCalcTrans_1  on  ProdCalcTrans_1.CollectRefProdId=ProdCalcTrans.CollectRefProdId
         and ProdCalcTrans_1.CollectRefLevel=0 and ProdCalcTrans_1.DATAAREAID=ProdCalcTrans.DATAAREAID
         inner join  EVS_BI_ITEMINFOTABLE EVS_BI_ITEMINFOTABLE_1 on EVS_BI_ITEMINFOTABLE_1.ItemId=ProdCalcTrans_1.RESOURCE_
         and EVS_BI_ITEMINFOTABLE.DATAAREAID=ProdCalcTrans.DATAAREAID

         where ProdCalcTrans.COLLECTREFLEVEL=1
         and prodTable.REALDATE between @FirsrDateOfMonth and @LastDateOfMonth
  
         and EVS_BI_ITEMINFOTABLE.ITEMGROUPID<>EVS_BI_ITEMINFOTABLE_1.ITEMGROUPID
         and ProdCalcTrans.DATAAREAID=''
         group by EVS_BI_ITEMINFOTABLE.ITEMGROUPID ,EVS_BI_ITEMINFOTABLE_1.ITEMGROUPID
         )kk
         group by TargetITEMGROUPID
         )kk1

		 set @month_number=@month_number+1

		 end


--verify
select sum(QUANTITY) from EVS_BI_ProductCostingRawMaterial where ITEMGROUPID='30010'


