trigger LeadTrigger on Lead (before delete) {

    LeadTriggerHandler obj = new LeadTriggerHandler();

    obj.doAction();
    
    
}