public  class AccountsBatch implements Database.Batchable<SObject> , Database.stateful{
    // cLASS AccountsBatch must implement the method
    integer recordCount=0;
      //start method --> SOQL QUERY -> ACCOUNT->50K(1 MIN RECORD, MAX: 10000 ER)
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator acc = Database.getQueryLocator([select id, name, active__c, Description from account]);
        return acc;
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        system.debug('inside execute method');
        system.debug('check recodCount First: '+recordCount);
        //update account records
        list<account> updateAccount = new list<Account>();
        for(account eachAcc : scope){
            If(eachAcc.Active__c != 'No'){
            eachAcc.Description += '...Updated  via batch';
            updateAccount.add(eachAcc);
            }
        }
        if(!updateAccount.isEmpty()){
            update updateAccount;
            recordCount+= updateAccount.size();
            system.debug('check record count SECOND: '+recordCount);
    }
    
    }

    public void finish(Database.BatchableContext bc){
        system.debug('finished with all records.');
        SYSTEM.DEBUG('check record count Final: '+recordCount);
    }
    //EXECUTE METHOD(LIST<ACCOUNT>)


    //FINISH METHOD -->ONE TIME
}