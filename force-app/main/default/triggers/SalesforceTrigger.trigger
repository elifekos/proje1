trigger SalesforceTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {

    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('calling future method now');
        
        //call handler here.
        SalesforceProjectTriggerHandler.createDefaultTickdt(Trigger.New);

        SalesforceProjectTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        //call method to validate ticket completion.
       // SalesforceProjectTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);

    }
    if(Trigger.isAfter && Trigger.isUpdate){
        //CALL METHOD1
        SalesforceProjectTriggerHandler.projectStatusChange(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);

    }
}