@isTest   
public with sharing class AccountTriggerTest {
    @isTest  
    public static void testMethod1() {
            //insert/update/delete records
        
         Account acc = new account();
            acc.Name = 'SI test';
            acc.Industry = 'Energy';
    
           /*Account acc2 = new account();
            acc2.Name = 'AI test';
            acc2.Industry = 'Energy';
    
            Account acc3 = new account();
            acc3.Name = 'BI test';
            acc3.Industry = 'Banking';*/
            
            list<account> listAcc = new list<account>{acc };
            insert listAcc;


            //asserts
            assert.isTrue(acc.id != null);


    }
    @isTest
    private static void testMethod2(){
        //
   //
   
   Account acc = new account();
   acc.Name = 'SI test';
   acc.Industry = 'Energy';
   insert  acc;

   acc.Name ='SI test 2';
   update acc;

   assert.areEqual('SI test 2', acc.Name);


    }
}