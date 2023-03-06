@isTest
public  class sf_assgTest {
    @isTest
    private static void testInsert() {
        sf_assg.insertsf();
        Salesforce_Project__c sp =[Select id,Project_Name__c FROM Salesforce_Project__c WHERE Project_Name__c LIKE '%Phone%' LIMIT 1];
        system.assert(sp !=null);

    }
    @isTest
    private static void testUpdate(){
        sf_assg.updatesf();
       list<Salesforce_Project__c> sp =[Select id,Project_Name__c FROM Salesforce_Project__c WHERE Project_Name__c ='Phone' ];
        system.assert(sp !=null);
    }
}