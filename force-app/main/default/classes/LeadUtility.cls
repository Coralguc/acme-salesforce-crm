public class LeadUtility {
    
    
    
    public static Integer getTotalLeads()
    {
        Integer totalLeads = 0;
        List<Lead> leadCount = [Select Id, Name from Lead
                               WHERE CreatedDate<LAST_N_DAYS:5];
        totalLeads = leadCount.size();
        system.debug(leadCount);
        return totalLeads;
        
    }

}