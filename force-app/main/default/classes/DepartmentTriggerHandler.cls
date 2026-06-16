//Collect all child records and store in a List, delete child while deleting the Parent
//  in before delete - Collect all child records in a List to delete the child in after Delete
//  two events Before and after Delete, can you take the data from before to after delete?
//  how - through static list - will work only in Class but not in Trigger
public class DepartmentTriggerHandler {
    
    
    List<Department__c> triggerNew;
    List<Department__c> triggerOld;
    Map<Id,Department__c> triggerNewMap;
    Map<Id,Department__c> triggerOldMap;
    
    Static List<Employee__C> empList = new List<Employee__C>();
    
    public DepartmentTriggerHandler ()
    {
        triggerNew = (List<Department__c>)Trigger.new;
        triggerOld = (List<Department__c>)Trigger.old;
        triggerNewMap = (Map<Id,Department__c>)Trigger.NewMap;        
        triggerOldMap =  (Map<Id,Department__c>)Trigger.OldMap; 
    }
    
    public void doAction()
    {    
        switch on Trigger.OperationType
        {
            When BEFORE_INSERT
            {
                
            }
            when AFTER_INSERT
            {
                
            }
            When BEFORE_UPDATE
            {
                
            }
            When AFTER_UPDATE
            {
                
                
                
            }
            WHEN BEFORE_DELETE
            {
                onBeforeDelete();                 
            }
            WHEN AFTER_DELETE
            {
                onAfterDelete();
                
            }
            
        }
        
    }    
    public void onBeforeDelete()
    {
      //Collect all child records
      //Set<Id> deptIds = triggerOldMap.keySet();
      empList = [Select Id, Name from Employee__c
                Where Department__c IN :triggerOld];          
        
    }
    public void onAfterDelete()
    {
        //Collect all child records and store in a List, delete child while deleting the Parent
    	if (empList.size() > 0)
        {
            delete empList;
        }
    }
    
}