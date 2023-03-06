
@isTest
public class AccountsBatchTest {
    @isTest
    public static void testBatch1(){
        //data preparetion
        List<account> listAcc = new list<Account>();
        for (Integer i = 0; i < 900; i++) {
            account a =new account(); 
            a.Name ='batch tes t'+i;
            a.Active__c ='Yes';
            a.Description = 'Test';
            listAcc.add(a);
            
        }
        insert listAcc;
        //AND OD DATA PREP

        //EXECUTE BETWEEN START AND STOPTEST
        Test.startTest();
        AccountsBatch ab= new AccountsBatch();
        Database.executeBatch(ab, 900);
        
        test.stopTest();

        //assertion
        list<account> allAccounts  = [select description from account];
        for (account ac : allaccounts) {
            assert.isTrue(ac.Description.containsIgnoreCase('batch'));
        }

    }
}