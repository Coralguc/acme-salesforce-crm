trigger DepartmentTrigger on Department__c (Before delete, After delete) {
    
    DepartmentTriggerHandler obj = new DepartmentTriggerHandler();
    obj.doAction();

}