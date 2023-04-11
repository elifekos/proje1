public  class AccountInvocable {

    @invocableMethod(label = 'Close Related Opportunities'
                        category = 'Account')
    public static void closeOpportunity(list<id> accountIds){
        //get all the related opportunities

        list<Opportunity> opps =[select id, StageName from Opportunity where AccountId IN : accountIds And StageName not in ('Closed  Won', 'Closed Lost')];

        if(!opps.isEmpty()){
            for(Opportunity opp : opps){
                opp.StageName = 'Closed Lost';
            }
            update opps;
        }

    }
    
}