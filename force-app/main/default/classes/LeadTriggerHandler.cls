public class LeadTriggerHandler {
    
        List<Lead> triggerNew;
        List<Lead> triggerOld;
        Map<Id,Lead> triggerNewMap;
        Map<Id,Lead> triggerOldMap;
        
        public LeadTriggerHandler ()
        {
            triggerNew = (List<Lead>)Trigger.new;
            triggerOld = (List<Lead>)Trigger.old;
            triggerNewMap = (Map<Id,Lead>)Trigger.NewMap;        
            triggerOldMap =  (Map<Id,Lead>)Trigger.OldMap; 
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
                
            }
            
        }    
          public void onBeforeDelete()
          {
              for(Lead leadRecord:triggerOld)
              {
                  if (leadRecord.status == 'Working - Contacted')
                  {
                      leadRecord.addError('Working Contacted Lead cannot be deleted');
                  }
              }
              
          }

}