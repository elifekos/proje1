public  class AccountHandler_assg {
    public static void accountCreatContact (List<Account> triggerNew,
                                            List<Account> triggerOld,
                                            Map<Id,Account> triggerNewMap,
                                            Map<Id,Account> triggerOldMap) {

        //create empty contact list
        list<contact> contactList = new list<contact>();
        //create each account in triggernew
        if(trigger.isInsert){
        for(account eachAcc : triggerNew){
            contact c = new Contact();
            c.LastName = eachAcc.Name+1;
            c.accountId =eachAcc.Id;
            contactList.add(c);
        }
        if(!contactList.isEmpty()){
            insert contactList;
        }
        }
        
    }
}