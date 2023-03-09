public  class AccountsQueueable  implements Queueable{
   public list<account> allAccounts =new list<account>();
    //constructor
    public AccountsQueueable(list<account> accs) {
        allAccounts = accs;
    }

    public void execute(QueueableContext qc){
    //update all accounts name
    for(account ac : allAccounts){
        ac.Name +='--SI';

    }
    update allAccounts;
    }
}