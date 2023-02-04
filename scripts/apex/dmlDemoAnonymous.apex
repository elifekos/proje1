DmlDemo.dmlMultipleRecordUpdate_right2();
DmlDemo.dmlMultipleRecordUpdate_right1();
DmlDemo.dmlMultipleRecordInsert_right2();
DmlDemo.dmlMultipleRecordInsert_right1();
DmlDemo.dmlInsertDemo_stndObj();
DmlDemo.dmlInsertDemo_cstmObj();
DmlDemo.dmlupdateDemo_stndObj();
DmlDemo.dmlUpdateDemo_stndObj3();
DmlDemo.dmlInsertDemo_stndObj2();
DmlDemo.dmlInsertDemo_cstmObj2();

list<account> delAccounts = [select id from account where createddate = TODAY ];
delete delAccounts;