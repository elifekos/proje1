@isTest
public with sharing class SPTriggerHandlerTest {
    @isTest
    private static void testFutureMethod() {
        //data prep
        //create instance
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c ='Learn TEST batch 13';
        sp.Description__c ='doing good everybody';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c ='Learn future TEST batch 13';
        sp2.Description__c ='doing good everybody';

    List<Salesforce_Project__c> listSP = new  List<Salesforce_Project__c> {sp, sp2};
    insert listSP;

    set<id> spIds = new set <id>{sp.id, sp2.id};

    //2.0 satart test
    Test.startTest();
    //call method
    SalesforceProjectTriggerHandler.updateProjectDescription(spIds);
    //2.1
    Test.stopTest();
 
    //3. verification --> Assert
    List<Salesforce_Project__c> allSP = [select id, description__c from Salesforce_Project__c];
    for (Salesforce_Project__c s : allSP) {
        assert.isTrue(s.Description__c.contains('future'));
           

    }
}
}