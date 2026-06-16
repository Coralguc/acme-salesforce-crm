public class TopNOpportunitiesbyAmount {

    
    public static List<Opportunity> getTopOpportunities(String stageName, Integer topCount,
                                          List<String>fieldsList, String orderDirection)
    {
       
        //Check Fieldlist is not null
        if(fieldsList == null || fieldsList.isEmpty())
            {
                fieldsList = new List<String>{'Id', 'Name', 'Amount'};
            }  
        
        if(orderDirection != 'ASC' && orderDirection != 'DESC') 
        {
            orderDirection = 'DESC';
        }
        
        String Fields = String.join(fieldsList, ',');
        
                
        String query = 'Select ' + fields + ' from Opportunity' + 
            ' WHERE StageName = :stageName' +
            ' Order By Amount ' + orderDirection +
            ' LIMIT ' + topCount;
        system.debug(query);
        return Database.query(query);
    }
}