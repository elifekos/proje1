public with sharing class CaseInvocable {
    @InvocableMethod(label ='Send Email & Save Activity' category = 'Case')
   
    public static void sendEmail(list<FlowInput> inputs){
      list < Messaging.SingleEmailMessage> messages = new list < Messaging.SingleEmailMessage>();
      
      for (FlowInput input : inputs) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setSubject('Case Created : '+input.caseNumber);
        message.setPlainTextBody('Hello there, \n'+ 'A case has been created your query.\n' + 'Thanks, \n'+'Salesforce');
        message.setTargetObjectId(input.contactId);
        message.setSaveAsActivity(true);

        messages.add(message);
        
      }
      Messaging.sendEmail(messages);

    }
    //wrapper class
    public class FlowInput{
        @InvocableVariable(label ='Case Number' required = true)
        public string caseNumber;
        @InvocableVariable(label ='Contact Id' required = true)
        public Id contactId;
    }
}