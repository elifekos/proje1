list<account> listA =[select id, name from account limit 50];
AccountsQueueable aq = new AccountsQueueable(listA);//will this work?
//we can do enqueueJob for the classes which IMPLEMENTS queuable.
id qId = system.enqueueJob(aq);

//we can executeBatch only the classes which implements batchable 
//Id batchId = Database.executeBatch(aq,21);