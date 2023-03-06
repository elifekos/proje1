@isTEst
public class DmlDemoAgainTest {
    @istest
    private static void testInsertStdObj() {
        DmlDemoAgain.dmlInsertDemo_stndObj(); //if this method works correctly, 
        //then we would GET one record in soql
        //
        account acc = [select id, name from account where name = 'softinnovas' limit 1];
        system.assert(acc != null);
        system.assertEquals('softinnovas', acc.Name);
    }
    @isTest
    private static void testInsertCstObj() {
        //call method
        DmlDemoAgain.dmlInsertDemo_cstmObj();

        //soql and assert
        List<Salesforce_Project__c> listSP = [select id, name, project_name__c from Salesforce_Project__c WHERE
        Project_Name__c = 'Learn dml batch 13'];

        system.assertEquals(1, listSP.size());
        assert.areEqual(1, listSP.size());
        
    }

    
    @istest
    private static void testUpdateDemo_stndObj3(){
        //prepare required data
        Account acc = new Account();
        acc.Name = 'softinnovas';
        insert acc;

        //call method to test
        DmlDemoAgain.dmlUpdateDemo_stndObj3();

        //how can  we verify?  ASSERTION
        //Fetch the updated record by SOQL
        account updatedAcc = [select id, name from account limit 1];
        system.assertEquals('SoftInnovas Inc.', updatedAcc.Name);
        assert.areEqual('SoftInnovas Inc.', updatedAcc.Name);
        assert.areEqual('9556789451', updatedAcc.Phone);
    }
    @istest
    private static void testInsertDemo_stndObj2(){
        //prepere required data
        Account acc = new Account();
        acc.Name = 'softinnovas';
        insert acc;

        //call method to test
        DmlDemoAgain.dmlInsertDemo_stndObj2();

        //how to verfy- SOQL
        contact c = [Select id, lastname, accountid from contact where lastname = 'Biden'];

        //assertion
        assert.areEqual(acc.id, c.AccountId);
        SYSTEM.assert(c != null);



    }
    @istest
    private static void testInsertDemo_cstmObj2(){
        //prepare required data
        Salesforce_Project__c spp =  new  Salesforce_Project__c();
        spp.Project_Name__c = 'test sp ';
         insert spp;

         //call method
         DmlDemoAgain.dmlInsertDemo_cstmObj2();

         //how to verify SOQL
         Salesforce_Ticket__c createST =[SELECT id, subject__c,Priority__c, Requested_by_date__c,Salesforce_Project__c, Status__c FROM  Salesforce_Ticket__c WHERE Subject__c = 'create related record' limit 1];

         system.assert(createST!=null);
         assert.areEqual(spp.id, createST.Salesforce_Project__c);
    }

}