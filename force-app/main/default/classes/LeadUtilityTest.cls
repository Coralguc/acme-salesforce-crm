@isTest
public class LeadUtilityTest {
    
    @isTest
    public static void testGetTotalLeads()
    {
        List<Lead> leadList = new List<Lead>();
        LeadList.add(new Lead(LastName = 'KenTest',Company='TIBCO'));
        LeadList.add(new Lead(LastName = 'KenTest1',Company='TIBCON'));
        Lead newLead = new Lead(LastName = 'ZenTest',Company='TIBCOL');
    	insert newLead;
       	Test.setCreatedDate(newLead.Id, Date.today().addDays(-6));
        
    	Integer totalLeads = LeadUtility.getTotalLeads();
        Assert.areEqual(1,totalLeads,'Unable to fetch Lead');
    	system.debug(totalLeads);
    }
    

}