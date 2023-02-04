public  class DML2_Assign {
    public static void insert_dml(){
        account acc1 = new account();
        acc1.Name = 'Elife';
        system.debug(acc1);
        insert acc1;
        Account acc2 = new account();
        acc2.Name = 'Assignment';
        system.debug(acc2);
        insert acc2;

    }
    public static void updating_dml(){
        account acc3 =new account();
        acc3.Name = 'Account Created';
        insert acc3;
        system.debug('acc3 created: '+acc3);

        acc3.Name = 'Account Updated';
        update acc3;
        system.debug('Updated acc3: '+acc3);
    }
    public static void createBulkContacts(){
        List<Contact> listContact1 = new List<Contact>();

       

        contact cnt1 = new Contact();
        cnt1.FirstName = 'Mark';
        cnt1.LastName= 'Ruffalo';
        listContact1.add(cnt1);

        contact cnt3 = new Contact();
        cnt3.FirstName = 'Mark';
        cnt3.LastName = 'Ruffalo';
        listContact1.add(cnt3);

        contact cnt2 = new Contact();
        cnt2.FirstName = 'Chris';
        cnt2.LastName = 'Hemsworth';
        listContact1.add(cnt2);

        contact cnt5 = new Contact();
        cnt5.FirstName = 'Scarlett';
        cnt5.LastName = 'Johansson';
        listContact1.add(cnt5);

        contact cnt4 = new Contact();
        cnt4.FirstName = 'Scarlett';
        cnt4.LastName = 'Johansson';
        listContact1.add(cnt4);

        insert listContact1;
        
    }
    public static List<contact> searchForContacts(string lastName){
        List<contact> cont = [select id, name from contact where LastName=:lastName ];


        return cont;

    }
    
}