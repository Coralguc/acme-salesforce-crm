public class RelationshipPTOCStandard {
    
    //Get Account with contact Names relationship SOQL Std to custom Object
    
    public static void getAccountNameswithContacts()
    {
        List<Account> accountList = [Select Name,(Select LastName from contacts) from
                                	Account];
        for(Account accRecord:accountList)
        {
            system.debug('AccountName :' +accRecord.Name);
            system.debug('======= Contacts are =======');
                         
            for(Contact conRecord:accRecord.contacts)
            {
                system.debug(conRecord.LastName);
            }
        }
    }
     public static void getAccountwithDepartments()
     {
         List<Account> accountList = [Select Name,
                                     (Select Name, Location__c from Departments__r)from Account];
         for(Account accRecord:accountList)
         {
             system.debug(accRecord.Name);
             for(Department__C depRecord:accRecord.Departments__r)
             {
                 system.debug('Department info: ' +depRecord.Name +' ' +depRecord.Location__c);
             }
                 
         }
     }


}