List<Contact> lstContact = [select id, name, account.id, account.name FROM contact ];
system.debug(lstContact);
for(contact eachContact : lstContact){
    string nameAccount = eachContact.account.name;
    string idAccount= eachContact.account.id;
    system.debug('account name: '+nameAccount + ', and account id: '+idAccount);
}
list<account> lstAccount = [select id, name, (select id, name from contacts) from account];
system.debug(lstAccount);

for (account eachAccount : lstAccount){
    string contactName = eachAccount.name;
    string contactId = eachAccount.id;
    system.debug('contact name: '+eachAccount.name + ', and contact id: '+eachAccount.id);

   List<contact> eachAccCont = eachAccount.contacts;
   for(Contact eachCont : eachAccCont){
                    system.debug('cont name is '+eachCont.Name + ' and id '+eachCont.Id);
                }
    }


                