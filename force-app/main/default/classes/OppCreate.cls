public with sharing class OppCreate {
    public static void createOpportunity() {
    List<Account> accList = [SELECT Id FROM Account LIMIT 1];
    List<Opportunity> oppList = new List<Opportunity>();
    if(accList.isEmpty()) {        
        return;
    }
    Opportunity opp = new Opportunity();
    opp.AccountId = accList[0].Id;
    opp.Name = 'XLon Upsell Opportunity';
    opp.StageName = 'Prospecting';
    opp.CloseDate = Date.today().addDays(30);
    oppList.add(opp);
    
    try{
        database.insert(oppList, AccessLevel.UserMode); 
    }
    catch(DmlException e){
        System.debug('Error occurred while inserting opportunity: ' + e.getMessage());
    }
}
}