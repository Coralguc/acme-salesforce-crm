/* Description : Get number of high priority cases in contact
* @Author : AJ
* @Created : 12/6/2026
*/

trigger CaseTrigger on Case (After insert, After update, After Delete, After Undelete) {
    
    Switch on Trigger.OperationType{
        
        When AFTER_INSERT
        {
            casesToUpdateinContact(trigger.new ); 
        }
        When AFTER_UPDATE
        {
            casesToUpdateinContact(trigger.new); 
        } 
        When AFTER_DELETE
        {
            casesToUpdateinContact(trigger.Old); 
        }
         When AFTER_UNDELETE
        {
            casesToUpdateinContact(trigger.new); 
        }
    }
    
    
    public static void casesToUpdateinContact(List<Case> caseList)
    {
       //Get Unique Parent Ids
        Set<Id> contactIds = new  Set<Id>();
        
       
        for(Case caseRecord:caseList)
        {
            if(caseRecord!=null)
            {
                contactIds.add(caseRecord.ContactId);
            }
        }
      
        //Use aggregate result to find the no of cases 
        List<AggregateResult> agresult = 
            					[Select Count(id) numberOfCases, ContactId
                                from Case 
                                where Priority = 'high' AND Status != 'Closed'
                                AND ContactId IN:contactIds
                                group by ContactId];
        
        //Add the no of cases per contact to the list 
        List<Contact> conList = new List<contact>();
        for(AggregateResult ar:agresult)
        {
            Contact conRecord = new Contact();
            conRecord.Id = (Id)ar.get('ContactId');
            conRecord.Total_high_Priority_Cases__c = (Decimal)ar.get('numberOfCases');
            conList.add(conRecord);
        }
        if(!conList.isEmpty())
        update conList;
    }
 }