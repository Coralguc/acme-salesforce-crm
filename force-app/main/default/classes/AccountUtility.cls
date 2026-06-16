public class AccountUtility {

    
    public static List<Account> getAccounts(String Rating)
    {
        List<Account> accountlist1 = [Select Id,Name,Rating, AnnualRevenue from Account
                  WHERE rating =:Rating];
        
        return accountlist1;        
    }
}