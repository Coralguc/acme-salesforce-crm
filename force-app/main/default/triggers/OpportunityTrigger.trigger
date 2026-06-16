//
trigger OpportunityTrigger on Opportunity (After update) {

    OpportunityHandler obj = new OpportunityHandler();

    obj.doAction();
    
    
}