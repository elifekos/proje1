@isTest
public  class ContactQueableTest {
    @isTest
    public static void ContactQueableTest1() {
LIST<Contact> listCont = new LIST<Contact>();
list<account> listAccount = new list<account>();
       
            account acc = new account();
            acc.Name = 'Test quable';
            acc.Active__c ='Yes';
            listAccount.add(acc);
            insert listAccount;

        test.startTest();
       
        system.enqueueJob(new ContactQueableapex(listAccount));
        TEST.stopTest();

        //assert
        list<contact> allcONTACTS = [select id, LastName from contact where LastName like '%Quenable'];
   system.assert(allcONTACTS !=null);
            
    }
}