public class OpportunityAccountIndustry {
    
    public static Map<Id,String> getOpportunityAccIndustry(List<Id> OppsIds)
    {
         Map<Id,String> oppAccountMap = new Map<Id,String>();
        
        List<Opportunity> oppAccRecord = [Select Id, Account.Industry 
                                          from Opportunity
                                          where Id IN:oppsIds and 
                                          Account.Industry !=null];
        for(Opportunity Opp :oppAccRecord)
        {
            if (Opp.AccountId !=null)
            {
            oppAccountMap.Put(Opp.Id, Opp.Account.Industry);
            }
            else
            {
                oppAccountMap.Put(Opp.Id, 'No Account Industry');
            }
        }
        return oppAccountMap;
    }

    public static void displayOpportunityAccIndustry
        			(Map<Id,String> oppAccountMap)
    {
         for(Id oppId :oppAccountMap.keySet())
        {
            system.debug('Opportunity Id :' +oppId);
            system.debug('AccountIndustry :' +oppAccountMap.get(oppId));
            
        }
    }
}