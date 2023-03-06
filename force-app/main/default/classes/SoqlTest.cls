@istest
public  class SoqlTest {

    @TestSetup
    static void makeData(){
        account acc = new Account();
        acc.Name = 'SI test';
        acc.Industry ='Energy';

        account acc2 = new Account();
        acc2.Name = 'AI test';
        acc2.Industry ='Energy';

        account acc3 = new Account();
        acc3.Name = 'BI test';
        acc3.Industry ='Banking';

        LIST<aCCOUNT>listAcc = NEW list<Account>{acc, acc2, acc3};
        insert listAcc;
        
    }

    @istest
    PRIVATE static void testChildToParent() {
        

        LIST<aCCOUNT> listAcc =[select id, name, industry from Account];

        list<Contact> listContact = new list<Contact>();
        for (Integer i = 0; i < 300; i++) {
            contact c = new contact();
            c.LastName ='anything '+i;

            if(i<100){
                c.AccountId = listAcc[0].id;
            }else if(i<200){
                c.AccountId = listAcc[1].id;
            }else{
                c.AccountId = listAcc[2].id;
            }
            listContact.add(c);
            
        }
        insert listContact;

        //we want to reset gov limit before actually calling method
        Test.startTest();
        SoqlDemo.childToParent_SOQL1();
        Test.stopTest();



    }
    @istest
    private static void testParentToChild(){
        //3 accounr records here
        list<account> listAcc =[select id, name, industry from Account];
        for(account eachAcc : listAcc){
            eachAcc.Type = 'Customer-Direct';
        }
        update listAcc;

        List<Opportunity> listOpp = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'test opp '+i;
            opp.StageName = 'ClosedWon';
            opp.CloseDate = date.today();

            if(i<100){
                opp.AccountId = listAcc[0].id;
            }else if(i<200){
                opp.AccountId = listAcc[1].id;
            }else{
                opp.AccountId = listAcc[2].id;
            }
            listOpp.add(opp);

            
        }
        insert listOpp;

        Test.startTest();
        SoqlDemo.parentToChild_SOQL1();
        Test.stopTest();

    }
    @isTest
    private static void testParentToChild2(){
        //prepare data -> 5 sec
     Salesforce_Project__c sp = new Salesforce_Project__c();
     sp.Project_Name__c = 'test sp';

      Salesforce_Project__c sp2 = new Salesforce_Project__c();
     sp2.Project_Name__c = 'test spsp';

     Salesforce_Project__c sp3 = new Salesforce_Project__c();
     sp3.Project_Name__c = 'test sp3';

     List<Salesforce_Project__c> listSP = new List<Salesforce_Project__c>{sp, sp2, sp3};
     insert listSP;


        
     List<Salesforce_Ticket__c> listST = new list<Salesforce_Ticket__c>();
        for (Integer i = 0; i < 300; i++) {
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Priority__c = 'High';
            st.Subject__c ='test st'+i;
            if(i<100){
                st.Salesforce_Project__c = sp.id;
            }else if(i<200){
                st.Salesforce_Project__c =sp2.id;
            }else{
                st.Salesforce_Project__c = sp3.id;
            }
            listST.add(st);
            }
            insert listST;

            Test.startTest();
            SoqlDemo.parentToChild_SOQL2();
            Test.stopTest();

          
            
        
    }

}