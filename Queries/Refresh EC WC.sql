 declare @FirsrDateOfMonth Datetime
         declare @LastDateOfMonth Datetime
        
        declare  @day_number Int =1;
        declare  @month_number Int=1;
        declare  @Years_Number Int=1;
        

        
        declare  @Year_NumPrev int =2022;


		truncate table Evs_BI_ElectAndWater

       while (@month_number<=12)
	   begin
                set @FirsrDateOfMonth =   cast(@Month_number as char(3)) +'/'+cast(@Day_number as char(3))+'/'+cast(@Year_NumPrev as char(4))
				set @LastDateOfMonth=EOMONTH(@FirsrDateOfMonth)
				print @FirsrDateOfMonth
				print @LastDateOfMonth
				
				

				  declare @Partition bigint 
         ,@RecID bigint=isnull((select max(recid) from  Evs_BI_ElectAndWater (nolock)),0)+1  
         select @Partition=PARTITION from DATAAREA where ID='ksa'
        
         insert into Evs_BI_ElectAndWater(FROMDATE,TODATE,ITEMGROUPID,TOTAL_EC_WT,DATAAREAID,PARTITION,RECID,RECVERSION) 
        
        
         Select @FirsrDateOfMonth,@LastDateOfMonth,ITEMGROUPID,Total_EC_WT,
        'ksa',@Partition,ROW_NUMBER ( ) Over (order by  ITEMGROUPID)+@RecID,1 from(

         select igt.ITEMGROUPID,sum(isnull(pb.QTYBOMCALC,0)) Total_EC_WT 
         from INVENTTABLE itt 
         left outer join InventPackagingGroup ipg on itt.PACKAGINGGROUPID=ipg.PACKAGINGGROUPID and itt.DATAAREAID=ipg.DATAAREAID
         left outer join ProdBOM pb  on pb.ITEMID=itt.ITEMID  and pb.DATAAREAID=itt.DATAAREAID        
         inner join inventtable ivt on ivt.ITEMID=pb.ITEMID and ivt.DATAAREAID=pb.DATAAREAID and ivt.COSTGROUPID in('EC','WC')
         left outer join ProdTable pt  on pt.DATAAREAID=pb.DATAAREAID and pt.PRODID=pb.PRODID
         inner join INVENTITEMGROUPITEM igt on igt.ITEMID=pt.ITEMID and igt.ITEMDATAAREAID=pt.DATAAREAID and
         igt.ITEMGROUPDATAAREAID=pt.DATAAREAID
         inner join INVENTITEMGROUP img on img.ITEMGROUPID=igt.ITEMGROUPID and img.DATAAREAID=igt.ITEMGROUPDATAAREAID
         where  pt.PRODSTATUS=7 and pt.DATAAREAID='ksa' group by igt.ITEMGROUPID
          )kk 

				
				set @month_number=@month_number+1
		end