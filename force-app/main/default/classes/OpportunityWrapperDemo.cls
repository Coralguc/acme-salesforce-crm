public class OpportunityWrapperDemo {
   
    Static Final Decimal highValueAmount = 100000;
    public static  List<OpportunityWrapper> setOppWrapper()
    {
        List<Opportunity> oppList = [Select Id, Name, Amount from 
                                Opportunity 
                                Where Amount!= null];
        List<OpportunityWrapper> oppWrapperList = new List<OpportunityWrapper>();  
    
        for (Opportunity rec :oppList)
        {

			OpportunityWrapper Obj = new OpportunityWrapper();            
            obj.recordId = rec.Id;
            obj.Name = rec.Name;
            obj.Amount = rec.Amount;
            if(rec.amount > highValueAmount)
            {
                obj.isHighValue = 'Yes';
            }
            oppWrapperList.add(obj);
         }
        return oppWrapperList;
        
    }
    

public class OpportunityWrapper
{    
    public id recordId;
    public String Name;
    Public decimal amount;
    public String isHighValue = 'No';
    
}
}