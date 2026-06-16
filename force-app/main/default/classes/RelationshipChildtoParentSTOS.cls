public class RelationshipChildtoParentSTOS {
    
    public static void contacttoAccounttoUser()
    {
        List<Contact> conRecord = [Select LastName, Account.Name, Account.Owner.Name from Contact];
        
        for(Contact con :conRecord)
        {
            system.debug('Contact Name :' +con.LastName);
            system.debug('Account Name :' +con.Account.Name);
            system.debug('Owner Name :' +con.Account.Owner.Name);
            
        }
        
    }

    public static void deptToAccounttoOwner()
        // Custom to Standard Object Relationship Child to Parent
    {
        List<Department__c> depList = 
            					[Select Name, Account__r.Name, Account__r.Owner.Name 
                                 from Department__c
                                 Where Account__c!=null];
        
        for(Department__c depRecord:depList)
        {
            system.debug('Department Name :' +depRecord.Name);
            system.debug('Account Name :' +depRecord.Account__r.Name);
            system.debug('Owner Name :' +depRecord.Account__r.Owner.Name);
            
        }
    }
    
    public static void getemployeesdepartment()
    {
        List<Employee__C> empList = 
            [select Employee_Name__c, Gender__C,Department__r.Name 
             from Employee__C];
       
        for(Employee__c empRecord:empList)
        {
            system.debug('Employee Name :' +empRecord.Employee_Name__c);
            system.debug('Gender :' +empRecord.Gender__C);
            system.debug('Department Name :' +empRecord.Department__r.Name);
            
        }
    }
}