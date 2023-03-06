@isTest
public with sharing class SalesforceTriggerHandlerAssgn24Test {
    @isTest
    public static void createDefTicketTest() {
    List<Salesforce_Project__c> spList = new List<Salesforce_Project__c>();
        for (Integer i = 0; i < 3; i++) {
            Salesforce_Project__c sp = new Salesforce_Project__c();
            sp.Project_Name__c = 'trigger  test';
            sp.Status__c = 'New';
            spList.add(sp);
            
        }
        insert spList;
        system.assertEquals(3,spList.size());

    }

    @isTest  
    public static void validateProjectCompTest(){
        Salesforce_Project__c sp3 = new Salesforce_Project__c();
            sp3.Project_Name__c = 'trigger  test3';
            sp3.Status__c = 'Completed';

            Salesforce_Project__c sp4 = new Salesforce_Project__c();
            sp4.Project_Name__c = 'trigger  test4';
            sp4.Status__c = 'In-progress';

            
        list<Salesforce_Project__c> spListNew = new  list<Salesforce_Project__c>{sp3, sp4};

        insert spListNew;

       Salesforce_Ticket__c st3 =new Salesforce_Ticket__c();
       st3.Subject__c =' Ticket new';
        st3.Status__c='New';
        st3.Salesforce_Project__c= spListNew[0].id;
        insert st3;

        Test.startTest();
        sp4.Status__c = 'Completed';
        update sp4;

        Test.stopTest();

        Salesforce_Project__c spQuery = [SELECT id, Status__c FROM  Salesforce_Project__c  WHERE Project_Name__c='trigger  test4'];

        system.assertEquals('Completed', sp4.Status__c);



    }
}