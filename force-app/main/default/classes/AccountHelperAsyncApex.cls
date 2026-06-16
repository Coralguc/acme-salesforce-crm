public class AccountHelperAsyncApex {
    
    @future
    public static void accountCreate(String records)
    {
        List<Account> accList = (List<Account>)JSON.deserialize
            				(records,List<Account>.Class);
            
    if(!accList.isEmpty())
    {
        insert accList;
    }
    }
}