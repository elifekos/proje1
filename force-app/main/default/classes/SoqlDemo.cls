public  class SoqlDemo {
   public static void accountSOQL_1(){
    List<Account>listAccount = [SELECT id, name from account];
    system.debug('list of accounts '+listAccount) ;
   }
   public static void accountSOQL_11(){
    account acc = [SELECT id, name, phone from account ORDER BY createddate desc limit 1];
    system.debug('account record '+acc);
    }
    public static void accountSOQL_2(){
    account acc = [SELECT id, name, phone, AccountNumber, Website from account ORDER BY createddate desc limit 1];
    system.debug('latest created account record '+acc);
    //print phone, name, accountnumber
    string aName = acc.Name;
    string aPhone = acc.Phone;
    system.debug('account name: '+aName + ' account phone '+ aPhone + ', account number is ' + acc.AccountNumber);

    }
    public static void accountSOQL_3(){
        List<Account> listAccount = [SELECT id, phone, name, accountnumber from  account ORDER BY createddate DESC];
        //for each  loop on the list
        for (account eachAcc : listAccount){
            system.debug('---each acc start----');
            system.debug('each acc: '+eachAcc);
            string accName = eachAcc.Name;
            string accPhone = eachAcc.Phone;
            system.debug('accName '+accName + '  phone  '+accPhone + ' account number is  '+ eachAcc.AccountNumber);
            system.debug('---each acc END----');

        }

    }
    public static void account_soqlFilter(){
        string accountName= 'GenePoint';
        List<Account> listacc = [SELECT name, phone from account WHERE name = 'GenePoint'];
        list<account> listacc1 = [SELECT name, phone from account WHERE name LIKE '%Point'];
        List<Account> listacc2 = [SELECT name, phone from account WHERE name = :accountName];
        system.debug('filter: '+listacc + 'filter1: '+listacc1 + 'filter2: '+listacc2);
    }
    public static void account_soqlFilter(string accountName){
       
        List<Account> listacc = [select name, phone from account WHERE  account.name = :accountName];
        system.debug('filter1: '+listacc);
    }
    public static void childToParent_SOQL1(){
        List<Contact> listContacts = [SELECT id, name, account.name, account.industry FROM contact WHERE account.industry ='energy'];
        for( contact eachContact : listContacts){
            String accName = eachContact.account.Name;
            system.debug('contact name is '+eachContact.name + ', its account name is '+accName+ '  and acc isdustry is '+eachContact.account.Industry);
        }
    }
    public static void parentToChild_SOQL1(){
        //FETCH ACCOUNT AND CLOSED WON OPP
        List<Account> listAccount = [select name, type, annualrevenue, (select name, amount from Opportunities where stagename = 'Closed Won') from  account where type = 'customer - direct'];
                            system.debug('customer direct is '+listAccount);
            for(account eachAcc : listAccount){
                system.debug('account name is '+eachAcc.Name+ +', its annual avenue is '+eachAcc.AnnualRevenue);
                system.debug('------');
                List<Opportunity> eachAccOpp = eachAcc.Opportunities;
                for(Opportunity eachOpp : eachAccOpp){
                    system.debug('opp name is '+eachOpp.Name + ' and amount '+eachOpp.Amount);
                }
            }
    }
    public static void parentToChild_SOQL2(){
        list<salesforce_project__c> listSP = [select id, name, project_name__c, 
                                    (select subject__c, priority__c from salesforce_tickets__r)
                                    from salesforce_project__c];
        //we need to print two things
            //1. total number of tickets in each project
            //2. high priority 
                        
        for (salesforce_project__c eachSP : listSP){
            //get all tickets of each project in list<salesforce
            list<salesforce_ticket__c> listST = eachSP.salesforce_tickets__r;
            system.debug('list ST '+ listST);
            integer totalTickets = listST.size();//size() method of list
            integer highPriorityTickets = 0;
            for(Salesforce_Ticket__c eachSt : listST){
                if (eachSt.Priority__c == 'High'){
                    highPriorityTickets++;
                }
            }
            system.debug('project name is '+eachSP.Project_Name__c+ ', total tickets '+totalTickets+ ', hp tickets '+highPriorityTickets);
    }  
  }
}