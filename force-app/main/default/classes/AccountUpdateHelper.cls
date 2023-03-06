public  class AccountUpdateHelper {
    @InvocableMethod
    public static void updateWebsite(List<Id> accountIds) {
        List<Account> listAccounts = [SELECT Id, website from Account WHERE id in :accountIds];
        for (account eachAcc  : listAccounts) {
            eachAcc.Website = 'www.softinnovas.com';
            
        }
        update listAccounts;
    }
}