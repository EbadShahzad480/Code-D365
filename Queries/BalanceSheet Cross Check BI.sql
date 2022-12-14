select * from  Evs_BI_BalanceSheetHeadingTable where HEADINGNAME = 'Accounts Payables'

select * from  Evs_BI_BalanceSheetLineTable


select t1.NAME,t2.ENUMID,t2.ENUMVALUE,t2.NAME EnumValueName from ENUMIDTABLE t1
inner join ENUMVALUETABLE t2 on t1.ID=t2.ENUMID
where t1.NAME='LedgerPostingType' and t2.NAME = 'TransferOpeningClosing'

select * from Evs_BI_BalanceSheetLineTable where Evs_BI_BalanceSheetLineTable.HeadingID = '31' and DATAAREAID='ksa'

select * from Evs_BI_BalanceSheetLineTable where Evs_BI_BalanceSheetLineTable.HeadingID = '32' and DATAAREAID='ksa'

-- Balance Sheet Cross Check
SELECT  sum(ACCOUNTINGCURRENCYAMOUNT)FROM generalJournalAccountEntry gae
inner join generalJournalEntry ge on gae.GeneralJournalEntry = ge.RecId
and ge.AccountingDate>='1/1/2022' and  ge.AccountingDate<='9/30/2022' and ge.SUBLEDGERVOUCHERDATAAREAID= 'ksa'              
inner join  mainaccount ma on ma.RECID = gae.MainAccount
inner join  Evs_BI_BalanceSheetLineTable bs on ma.MainAccountId >= bs.MainAccountId_From and ma.MainAccountId <= bs.MainAccountId_To
and bs.HeadingID = '18'
and gae.POSTINGTYPE!='19'

Evs_BI_BalanceSheetLineTable





SELECT  sum(ACCOUNTINGCURRENCYAMOUNT)FROM generalJournalAccountEntry gae
inner join generalJournalEntry ge on gae.GeneralJournalEntry = ge.RecId
and ge.AccountingDate>='1/1/2022' and  ge.AccountingDate<='9/30/2022' and ge.SUBLEDGERVOUCHERDATAAREAID= 'ksa'              
inner join  mainaccount ma on ma.RECID = gae.MainAccount
inner join  Evs_BI_BalanceSheetLineTable bs on ma.MainAccountId >= bs.MainAccountId_From and ma.MainAccountId <= bs.MainAccountId_To
and bs.HeadingID = '18'
and gae.POSTINGTYPE!='19'




select * from Evs_BI_BalanceSheetLineTable where HEADINGID=18 and DATAAREAID='ksa'