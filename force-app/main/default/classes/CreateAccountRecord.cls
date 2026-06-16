public class CreateAccountRecord {

    public static id createAccount(String Name, String Rating)
    {
        Account acc = new Account();
        acc.Name = Name;
        acc.Rating = Rating;
        insert acc;
        system.debug(acc.Name+' '+ acc.Rating +acc.Id);
        return acc.Id;
    }
    Public static void createContact(Integer Count, Id AccountId)
    {
        List<Contact> contactList = new List<Contact>();
        for(integer i= 1;i<=Count;i++)
        {
        	Contact con = new Contact(AccountId = AccountId, LastName = 'GenZ' +i );
            contactlist.add(con);
        }
        insert contactList;
        system.debug(contactList);
    }
     Public static void updateAccountBillingState(String BillingState, String NewBillingState)
    {
    	List<Account> accountList = [Select Name, BillingState from Account 
                                    Where BillingState = :BillingState];
        system.debug(accountList);
        for(Account acc:accountList)
        {
           acc.BillingState = NewBillingState;
           
        }
        update accountList;
    }
}