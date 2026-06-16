public class ContactAccountLookup {
//SOQL DIY1
    public static Map<Id, String> getContactAccountName
        					(List<Contact> Contacts)
    {
    
      Set<Id> accountIds = new Set<Id>();
        for(Contact con :Contacts)
        {
            if (con.AccountId!=null)
            {
                accountIds.add(con.AccountId);
            }  
        }
    
    	
    
    Map<Id, Account> accountsMap = new  Map<Id, Account>
        ([Select Id, Name from Account 
            WHERE Id IN :accountIds]);
    
	
        Map<Id, String> contactAccount = new  Map<Id, String>();
        
        for(Contact con :Contacts)
        {
            if(con.AccountId!=null && accountsMap.containsKey(Con.AccountId))
            {
               contactAccount.Put(con.AccountId, 
                                  accountsMap.get(Con.AccountId).Name);
                
            }
            else
            {
               contactAccount.Put(con.AccountId, 'No Account exists');
            }
        }
        return contactAccount;
        
    }
    }