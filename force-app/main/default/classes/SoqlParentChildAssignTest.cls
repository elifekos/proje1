@isTest
public  class SoqlParentChildAssignTest {
    @TestSetup
    static void makeData(){
      list<account> listAcc =new  list<account>();
      for (Integer i = 0; i < 10; i++) {
        Account acc = new Account();
        acc.Name = 'assg account'+i;
        listAcc.add(acc);
        
      } 
      insert listAcc;

      list<contact> listCont = new List<Contact>();
      for(account eachAcc : listAcc){
        for (Integer i = 0; i < 10; i++) {
            contact cont = new Contact();
            cont.LastName = 'assign contact'+i;
            cont.AccountId = eachAcc.Id;
            listCont.add(cont);
        }
      } 
      insert listCont;       
    }
    @isTest  
    private static void testPrintContactAcc(){
        list<contact> contList = [SELECT id, name, Account.Id, Account.Name FROM Contact];
        test.startTest();
        SoqlParentChildAssignment.printContactAccounts();
        test.stopTest();
    }

    @isTest   
    public static void testPrintAccCont(){
        List<Account> lstAccount = [SELECT id, name, (Select id, Name FROM Contacts) FROM Account];
        test.startTest();
        SoqlParentChildAssignment.printAccountContacts();
        test.stopTest();
    }
    
}