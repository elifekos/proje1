public with sharing class ContactTriggerHandler {
    public static void contactValidation1(List<Contact> conTriggerNew,
                                        List<Contact> conTriggerOld,
                                        Map<id, Contact> conTriggerNewMap,
                                        Map<id, Contact> cOnTriggerOldMap) {
        //Validate if contact s lead source was partner referrral
        for(contact eachContact : conTriggerNew){
            if(cOnTriggerOldMap.get(eachContact.Id).LeadSource =='Partner Referral'){
                eachContact.addError('Partner referral contacts can not be changed ');
            }
        }

    }
}