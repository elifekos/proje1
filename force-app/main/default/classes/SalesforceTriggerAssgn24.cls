@isTest   
public with sharing class SalesforceTriggerAssgn24 {
    @isTest
    public static void methodTest1(){

       
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'new project ';
        spList.add(sp);

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'new project2 ';
        spList.add(sp2);

        list<Salesforce_Project__c> spList = new  list<Salesforce_Project__c>{sp, sp2};
        //dml will fire trigger
        insert spList;

       for(Salesforce_Project__c eachSP : spList){
        eachSP.Status__c= 'New';
       }
       //dml will fire trigger
        update spList;
    }
    @isTest   
    public static void methodTest2(){

        List<Salesforce_Project__c> spList = new List<Salesforce_Project__c>();
        Salesforce_Project__c sp1 = new Salesforce_Project__c();
        sp1.Project_Name__c = 'new project ';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'new project2 ';

        //list<Salesforce_Project__c> spList = new  list<Salesforce_Project__c>{sp, sp2};

        insert spList;

       list<Salesforce_Ticket__c> stList = new list<Salesforce_Ticket__c>();

       list<Salesforce_Ticket__c> st1 = new list<Salesforce_Ticket__c>();
      
       st1.Subject__c='New';
       st1.Salesforce_Project__c= stList[0].id;
       stList.add(st1);

       list<Salesforce_Ticket__c> st2 = new list<Salesforce_Ticket__c>();
    
      
       st2.Subject__c='New record';
       st2.Salesforce_Project__c= stList[1].id;
       stList.add(st2);

       insert stList;

    }
}