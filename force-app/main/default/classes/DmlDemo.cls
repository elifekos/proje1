public class DmlDemo {
    public static void dmlInsertDemo_stndObj(){
      //create instance of sObject
      account acc = new account();//similar to clicking new button
      //set field names
      acc.Name = 'SoftInnovas';
      
      //insert dml create records
      insert acc;
      system.debug(acc);

    }
    public static void dmlInsertDemo_cstmObj(){
        //create instance
        Salesforce_Project__c sp = new Salesforce_Project__c();
        //SET FIELDS
        sp.Project_Name__c = 'Lean dml to batch 13';
        sp.Description__c = 'doing good everybody';

        //save it by 'insert'
        insert sp;
    }
    public static void dmlupdateDemo_stndObj(){
        //create instance
      account ac = new account();
      ac.Name = 'Salesforce';
      system.debug('axx before inserting: '+ac);
      insert ac;
      system.debug('acc insert called: '+ ac);

      //update any record.We must have id
      ac.Name = 'Salesforce Inc.';
      //update dml
      update ac;
      system.debug('after updating '+ ac);
    }
    public static void dmlUpdateDemo_stndObj3(){
      //get record from org
      account acc = [select id, name from account where name = 'SoftInnovas' limit 1];

      //update name
      acc.Name = 'SoftInnovas Inc.';
      acc.Phone = '9556789451';
      // update dml
      update acc;
    }
    public static void dmlInsertDemo_stndObj2(){
      account ac = [select id, name from account where name like 'SoftInnovas%' limit 1];  
      //create contact instance
      Contact c = new Contact();
      c.LastName = 'Biden';
      //related field id
      c.accountId = ac.Id;
      //create contact record
      insert c;
      }
      public static void dmlInsertDemo_cstmObj2(){
        //soql query to get project
        Salesforce_Project__c sp = [SELECT id, name from Salesforce_Project__c ORDER BY createddate desc LIMIT 1];

        //created ticket
        Salesforce_Ticket__c newST = new Salesforce_Ticket__c();
        newST.Subject__c = 'create related record';
        newST.Priority__c = 'High';
        newST.Requested_by_date__c = date.today();
        newST.Status__c = 'New';
        //relationship field
        newST.Salesforce_Project__c = sp.Id;
        insert newST;
      }
      public static void dmlMultipleRecordInsert_right1(){
        List<account> listAcc = new List<account>();
        Account acc1 = new Account();
        acc1.Name = 'bulk acc1';
        listAcc.add(acc1);

        Account acc2 = new Account();
        acc2.Name = 'bulk acc2';
        listAcc.add(acc2);

        Account acc3 = new Account();
        acc3.Name = 'bulk acc3';
        listAcc.add(acc3);

        insert listAcc;


      }
      public static void dmlMultipleRecordInsert_right2(){
        List<account> listAcc = new List<account>();
        for (integer i = 0; i<160; i++){
          Account acc = new account();
          acc.Name = 'Softinnovas v'+ i;
          acc.Phone = '98765432'+ i;
          acc.AccountNumber = 'ACS '+i;
          acc.Active__c = 'Yes';
          listAcc.add(acc);
        }
        
        if (!listAcc.isEmpty()){
          insert listAcc;
        }
       }
       public static void dmlMultipleRecordUpdate_right1(){
        List<account> listAccount = [select id, name from account order by CreatedDate desc limit 20];

        //append b.0 in accounts
        for (account acc : ListAccount) {
          acc.Name = acc.Name + 'B.0';
          
        }
        update listAccount;

       }
       //update account name
       //append Yy--> if active is yes
       //append Nn --> if active is null
       public static void dmlMultipleRecordUpdate_right2(){
        List<account> listAccount = [select id, name, Active__c from account];

        List<account> updateAccount = new List<account>();

        for (account eachAcc : listAccount) {
          if(EAchAcc.Active__c == 'Yes'){
            eachAcc.Name += 'Yy';
            updateAccount.add(eachAcc);
          }else if (eachAcc.Active__c == null){
            eachAcc.Name += 'Nn';
            updateAccount.add(eachAcc);
          }
          
        }
        if (!updateAccount.isEmpty()){
          update updateAccount;
        }

       }
}