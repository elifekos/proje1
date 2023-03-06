public  class ContactsBatch implements Database.Batchable<SObject> , Database.stateful {
    //must implement
    integer recordCount = 0;
    //start, execute, finish
    //1-start-soql queryy
    public Database.QueryLocator start(Database.BatchableContext bc) {
        Database.QueryLocator cont = Database.getQueryLocator([select id, LastName, Description from Contact]);

        return cont;

    }
    //2-execute method
    public void execute(database.BatchableContext bc, List<Contact> listCont){
        system.debug('inside execute method');
        system.debug('check recodCount First: '+recordCount); 
        //UPDATE Contact record
        
        list<contact> updateContact = new list<contact> ();
        for(contact eachCont : listCont){
            eachCont.Description ='Updated by batch';
            updateContact.add(eachCont);
        }
        if(!updateContact.isEmpty()){
            update updateContact;
            recordCount += updateContact.size();
            system.debug('Check record count second: '+recordCount);
        }
    }
    //finish method
    public void finish(Database.BatchableContext bc){
        system.debug('finished with all records');
        system.debug('check record count final: '+recordCount);
    }
   
}