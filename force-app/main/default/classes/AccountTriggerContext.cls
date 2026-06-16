public class AccountTriggerContext {
    
    public List<Account> triggerNew {get; Private Set;}
    public List<Account> triggerOld {get; Private Set;}
    public Map<Id, Account> triggerNewMap {get; Private Set;}
    public Map<Id, Account> triggerOldMap {get; Private Set;}
    
    public AccountTriggerContext()
    {
        triggerNew = (List<Account>)Trigger.New;
        triggerOld = (List<Account>)Trigger.Old;
        triggerNewMap = (Map<Id, Account>)Trigger.NewMap;
        triggerOldMap = (Map<Id, Account>)Trigger.OldMap;
    }
    
}