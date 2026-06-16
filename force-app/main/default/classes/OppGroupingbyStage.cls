public class OppGroupingbyStage {

    public static Map<String,List<Opportunity>> 
        opportunitiesbyStage(
            List<Opportunity> opportunityList)
    {
     Map<String, List<Opportunity>> opportunityMap = 
         new Map<String, List<Opportunity>>();
    
    for(Opportunity Opp:opportunityList)
    {
        if (opportunityMap.containsKey(Opp.stageName))
    {
        opportunityMap.get(Opp.stageName).add(Opp);
    }
    else
    {
        opportunityMap.put(
            Opp.stageName, 
            new List<Opportunity>{Opp});
    }
    }
        return opportunityMap;
    }
       public static void displayOpportunitiesbyStage(Map<String, List<Opportunity>> oppResult)
       {
        for(String Stage : oppResult.keyset())
        {
            system.debug('=================');
            system.debug('Stage :' +Stage);
            system.debug('=================');
           for(Opportunity Opp:oppResult.get(Stage))
            {
                system.debug('Opportunity Name' +Opp.Name+ ' ' +Opp.Amount);
              //  system.debug('Opportunity Amount' +Opp.Amount);
            }
        }  
    } 
}