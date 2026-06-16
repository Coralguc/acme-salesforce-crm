trigger AccountTrigger on Account (After insert, after update) {
       
      AccountTriggerHandler obj = new AccountTriggerHandler();
      obj.doAction();
}