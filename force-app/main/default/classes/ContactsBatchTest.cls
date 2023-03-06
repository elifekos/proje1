@isTest
public  class ContactsBatchTest {
 @isTest
 public static void testBatch1(){
    //data prep
    list<contact> listCont = new list<contact>();
    for (Integer i = 0; i < 100; i++) {
        contact c = new contact();
        c.LastName ='Batch Test';
        c.Description = 'Batch Test Update';
        listCont.add(c);
        
    }
    insert listCont;
    //execute between statr and stoptest
    test.startTest();
    ContactsBatch ab = new ContactsBatch();
    Database.executeBatch(AB, 100);
    TEST.stopTest();

    //ASSERTION
    LIST<CONTACT> allContacts = [select LastName, description from contact];
    for(contact cc : allContacts){
    assert.isTrue(cc.Description.containsIgnoreCase('Batch Test Update'));
        }
    }

}