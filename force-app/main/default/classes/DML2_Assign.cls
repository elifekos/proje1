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
    
}