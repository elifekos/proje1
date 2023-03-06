public with sharing class ContactTriggerHandler {
    /*public static void contactValidation1(List<Contact> conTriggerNew,
                                        List<Contact> conTriggerOld,
                                        Map<id, Contact> conTriggerNewMap,
                                        Map<id, Contact> cOnTriggerOldMap) {
                                            */
        //Validate if contact s lead source was partner referrral
        //one by one contact using for each  loop of trigger.new
        //why in trigger.new?
          //addError can be done on trigger.new and trigger.newMap only
          //addError NOT BE POSSIBLE trigger.old, and trigger.oldMap
        /*for(contact eachContact : conTriggerNew){
              //check if LeadSource WAS Partner Referral, 
                //so we get the OLD record from oldMap to check leadsource field value
            //allows to change leadsource
            if(cOnTriggerOldMap.get(eachContact.Id).LeadSource =='Partner Referral'){
                // addError CAN be done on trigger.new  and trigger.newMap  ONLY
                eachContact.addError('Partner referral contacts can not be changed ');
            }
        }

    }
    */
   /* public static void contactValidation2(List<Contact> conTriggerNew,
                                            List<Contact> conTriggerOld,
                                            Map<id, Contact> conTriggerNewMap,
                                            Map<id, Contact> cOnTriggerOldMap){
        for(contact eachContact : conTriggerNew){
            //check if leadSource is changed
            if(eachContact.LeadSource != cOnTriggerOldMap.get(eachContact.Id).LeadSource){
                eachContact.LeadSource.addError('CANNOT CHANGE LEAD SOURCE.PLEASE USER!');
            }
        }                                       

    }*/
    public static void rollUpSummary(List<Contact> conTriggerNew,
                                        List<Contact> conTriggerOld,
                                        Map<id, Contact> conTriggerNewMap,
                                        Map<id, Contact> cOnTriggerOldMap){
        //contact created and account is added -> insrease count of 'number of contacts' for that account
        //contact updateted and account is added ->  increase count of new account
         //                                      -> Decrease count of old account
        //contact delete                         ->Decrease count of OLd account
        //contact is undeleted                   -> increase count of new account
          set<id> accIds = new set<id>();                                  
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
            for(contact eachCon : conTriggerNew){
                if(eachCon.accountId != null){
                    accIds.add(eachCon.AccountId);
                }
            }
        }
        system.debug('account ids '+accIds);
         List<account> listAccount = [SELECT id, number_of_contacts__c, (Select id from contacts)from account WHERE id IN :accIds];
        for(account eachAcc : listAccount ){
            integer numOfContacts = 0;
            if(eachAcc.Contacts != null){
            numOfContacts = eachAcc.Contacts.size();
            }
             //set number of contacts field value to size
            eachAcc.number_of_contacts__c = numOfContacts;
        }
        if(!listAccount.isEmpty()){
            update listAccount;
        }
       
    }
  
    


}