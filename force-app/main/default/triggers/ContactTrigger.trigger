trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    if(trigger.isBefore && trigger.isUpdate){

        //call validation method here
        ContactTriggerHandler.contactValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    
}