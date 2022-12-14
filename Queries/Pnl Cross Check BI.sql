-- PnL Cross Check
SELECT  sum(ACCOUNTINGCURRENCYAMOUNT) FROM generalJournalAccountEntry
inner join    generalJournalEntry on  generalJournalAccountEntry.GeneralJournalEntry = generalJournalEntry.RecId
and  generalJournalEntry.AccountingDate>='1/1/2022' and  generalJournalEntry.AccountingDate<='9/30/2022'  
and  generalJournalEntry.SUBLEDGERVOUCHERDATAAREAID='ksa'
inner join  mainaccount  on mainaccount.RECID=generalJournalAccountEntry.MainAccount
left join DimensionAttributeValueCombination on DimensionAttributeValueCombination.RECID=generalJournalAccountEntry.LEDGERDIMENSION
where mainaccount.MainAccountId >='4210105'  and mainaccount.MainAccountId <='4210106' and 
 ITEMGROUP <>0 and ITEMGROUPVALUE  between '30030' and '30070' or ITEMGROUPVALUE = '30010'




