public class OpportunityHandler {
        
        List<Opportunity> triggerNew;
        List<Opportunity> triggerOld;
        Map<Id,Opportunity> triggerNewMap;
        Map<Id,Opportunity> triggerOldMap;
        
        public OpportunityHandler ()
        {
            triggerNew = (List<Opportunity>)Trigger.new;
            triggerOld = (List<Opportunity>)Trigger.old;
            triggerNewMap = (Map<Id,Opportunity>)Trigger.NewMap;        
            triggerOldMap =  (Map<Id,Opportunity>)Trigger.OldMap; 
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
                   onAfterUpdate();
                   
                  
                }
                
            }
            
        }    
        public void onAfterUpdate()
        {
             //Create a task when Opp Closed won
                    List<task> taskList = new List<task>();
                    for(Opportunity record:triggernew)
                    {
                        
                        Opportunity oldMap = triggeroldMap.get(record.id);
                        Map<Id,User> userMap = new Map<Id,User>([Select id, Name from
                                                               User Where isActive = TRUE]);
                        
                        if(record.StageName == 'Closed Won' &&
                           oldMap.StageName != 'Closed Won')
                    {
                        task taskRecord = new task();
                        taskRecord.whatId = record.Id;
                        taskRecord.OwnerId = record.ownerId;
                        taskRecord.Subject = 'Follow Up';
                        taskRecord.Description = 'Hi'+userMap.get(record.ownerId)?.Name  +'\n Please follow this Opportunity';
                        taskList.add(taskRecord);
                    }
                    }
            if(!taskList.isEmpty())
            {   
                insert taskList;
            }
  
        }
    }