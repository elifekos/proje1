trigger LeadTrigger on Lead (before insert, before update) {
    List<Lead> listLead = trigger.new;
    
    if(trigger.isInsert){
        System.debug('---started insert---');
        for(Lead eachLead : listLead){
            System.debug('New valu is: '+eachLead);
        }
    }
    if(trigger.isUpdate){
        System.debug('----updated----');
            for(Lead eachUpdate : listLead){
                System.debug('updated record Id is: '+eachUpdate.Id+ ', record name is: '+eachUpdate.LastName+ ', description is: '+eachUpdate.Description);
            }
    }
}
    



