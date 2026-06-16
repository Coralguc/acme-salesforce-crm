public class LeadHelper {

    
    public static Integer leadCommission(String LeadId)
    {
        Integer Commission = 0;
        List<Lead> leadRecord = [Select Lead_Generator__C from
            			Lead Where Id =:LeadId];
        System.debug(leadRecord);
       
        if(!leadRecord.IsEmpty())
        {
            List<User> userRecord = [Select profileId, Profile.Name
                from User where Id = :leadRecord[0].Lead_Generator__c];
            if(!userRecord.isEmpty())
            {
               Commission =  (Integer)Commission__c.getInstance
                   			(userRecord[0].ProfileId).Commision_Amount__c;
            }
        }
        return Commission;
      }
}