public class AccountTriggerHandler {
    
   private AccountTriggerContext Context;
   public AccountTriggerHandler()
   {
      Context = new AccountTriggerContext();
   }
       
    public void doAction()
    {
        switch on Trigger.OperationType
        {
            When BEFORE_INSERT
            {
                
            }
            When AFTER_INSERT
            {
               
            }
            When BEFORE_UPDATE
            {
                
            }
            When AFTER_UPDATE
            {
				AccountContactAddressService.onAfterUpdate(Context);
            }
            When BEFORE_DELETE
            {
                
            }
            When AFTER_DELETE
            {
                
            }
        }
    }
    
  
}