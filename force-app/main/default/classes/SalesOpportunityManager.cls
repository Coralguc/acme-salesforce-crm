public class SalesOpportunityManager {
	
    Map<String, List<String>> opportunitiesMap = new Map<String, List<String>>();
    //Initialize constructor
    Public SalesOpportunityManager()
    {
        opportunitiesMap.put('Kiran', new List<String>{'Opp1','Opp2'});
        opportunitiesMap.put('Meena', new List<String>{'Opp3'});
        
    }
    
   //Get a Single Opportunity Value
   Public void addOpportunity(String SalesPerson, String newOpps)
   {
       if(opportunitiesMap.containsKey(Salesperson))
       {
           opportunitiesMap.get(SalesPerson).add(newOpps);  
       }
       else
       {
           opportunitiesMap.Put(SalesPerson, new List<String>{newOpps});
       }
   }
    //Get the list of values
    public void addOpportunity(String SalesPerson, List<String> newOpps)
    {
        if(opportunitiesMap.containsKey(SalesPerson))
        {
         opportunitiesMap.get(SalesPerson).addAll(newOpps); 
        }
         else 
         {
             opportunitiesMap.put(SalesPerson, newOpps);
         }
    }
    public void showAllSalesPersonOpportunities()
    {
        for(String SalesPerson :opportunitiesMap.keySet())
             {
                 system.debug(Salesperson + '---->'+opportunitiesMap.get(SalesPerson));
                 
             }
    }
}