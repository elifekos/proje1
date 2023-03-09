trigger ContactTrigger on Contact (before insert, after insert, before update, after update, after delete) {
   if(trigger.isBefore && trigger.isUpdate){

        //call validation method here
    ContactTriggerHandler.contactValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    ContactTriggerHandler.contactValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    
    if(trigger.isAfter){
      ContactTriggerHandler.rollUpSummary(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    
}