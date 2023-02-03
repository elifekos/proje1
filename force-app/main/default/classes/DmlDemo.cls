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
}