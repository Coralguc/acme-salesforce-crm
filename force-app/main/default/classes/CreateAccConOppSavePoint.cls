public class CreateAccConOppSavePoint {
    
    public static void accOppConCreationSaveRollback
        			(Account accRecord, String Stage)
    {
        SavePoint sp = Database.setSavePoint();
        try{
            
        insert accRecord; 
        Contact con = new Contact(LastName = accRecord.Name +' Contact', 
                               AccountId = accRecord.Id);
        insert con;
        Opportunity opp = new Opportunity(Name = accRecord.Name +' Opportunity', 
                               AccountId = accRecord.Id, 
                               StageName = Stage,
                               CloseDate = date.today().addDays(30)
                                );
        insert opp;
        }
        Catch(Exception Ex)
        {
            
            Database.rollback(sp);
            system.debug(Ex);
        }
    }
        

}