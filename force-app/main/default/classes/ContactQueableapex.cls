public class ContactQueableapex implements Queueable {
    public List<account> allAccounts = new list<account>();
     
    //call constructure
    public ContactQueableapex(LIST<Account> accs){
        allAccounts = accs;
    }
    public void execute(QueueableContext qc){
        List<Contact> contList = new List<Contact>();
        for(account eachAcc : allAccounts){
            contact con = new Contact();
            con.LastName = eachAcc.Name+ '  Quenable';
            con.AccountId = eachAcc.id;
            contList.add(con);
        }
        insert contList;
    }
}