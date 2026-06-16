public class RelationshipContacttoAccountHelper {

    public static Map<Id,String> getContactAccountNames(List<Id> contactIds)
    {
        Map<Id,String> conAccountMap = new Map<Id,String>();
        
        List<Contact> Contacts = 
            [select Id, Account.Name from contact 
            Where Id IN : contactIds];
        
        for(Contact con:Contacts)
        {
            if(con.AccountId!=null)
        {
            conAccountMap.Put(con.Id, Con.Account.Name);
        }
        else
        {
            conAccountMap.Put(con.Id, 'No accountName');
        }
        }
        return conAccountMap;
        
    }    
    public static void displayContactAccountNames(Map<Id,String> conAccountMap)
    {
        for(Id conId :conAccountMap.keySet())
        {
            system.debug('Contact Id :' +conId);
            system.debug('AccountName :' +conAccountMap.get(conId));
            
        }
    }
}