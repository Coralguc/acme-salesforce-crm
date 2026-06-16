public class AccountContactAddressService {

public static void onAfterUpdate(AccountTriggerContext Context)
{
    Set<Id> accountIds = new Set<Id>();      
    
    for(Account acc: Context.triggerNew)
        
    {
        
        Account oldAcc = Context.triggerOldMap.get(acc.Id);
        
        if(acc.BillingStreet != oldAcc.BillingStreet ||
            acc.BillingCity != oldAcc.BillingCity ||
            acc.BillingState != oldAcc.BillingState ||
            acc.BillingPostalCode != oldAcc.BillingPostalCode ||
            acc.BillingCountry != oldAcc.BillingCountry)
        {
            accountIds.add(acc.Id);
        }
    }
    
    if(accountIds.isEmpty())
    {
        return;
    }
    
    List<Contact> listContact = new List<Contact>();
    
    List<Account> accountList = [Select Id, BillingStreet,
                                
                                BillingCity,
                                BillingState,
                                BillingPostalCode,
                                BillingCountry, 
                                (
                                    Select Id, MailingStreet,
                                    MailingCity,
                                    MailingState,
                                    MailingPostalCode,
                                    MailingCountry 
                                    from Contacts)
                                
                                from Account
                                
                                Where Id IN :AccountIds];
    
    
    
    for(Account acc:accList)
        
    {
        
        for(Contact conRecord :acc.Contacts)
            
        {
            
            conRecord.MailingStreet = acc.BillingStreet;
            conRecord.MailingCity = acc.BillingCity;
            conRecord.MailingState = acc.BillingState;
            conRecord.MailingPostalCode = acc.BillingPostalCode;
            conRecord.MailingCountry = acc.BillingCountry;
            
            listContact.add(conRecord);
        
        }
        
    }
    
    if(!listContact.isEmpty()) 
        
    {     
        update listContact;
        
    }
    
}    

}