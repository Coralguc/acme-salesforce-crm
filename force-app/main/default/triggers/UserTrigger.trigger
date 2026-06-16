trigger UserTrigger on User (After insert) {
    
    
    
    PermissionSet pset = [select Id from PermissionSet 
                            where name = 'Common_User_PermissionSet'];
    //User Permission Set Assignment
    //Permission Set, PermissionSetASsignment - Assigned Id - UserId , PermissionSet Id
    //Create account record
    List<Account> accList = new List<Account>();
    List<PermissionSetAssignment> psaList = new List<PermissionSetAssignment>();
    
    for(User userRecord:Trigger.New)
    {
        accList.add(new Account(Name = userRecord.LastName));
        PermissionSetASsignment psaRecord = new PermissionSetASsignment(
        									AssigneeId =  userRecord.Id,
        									PermissionSetId = pset.Id );
        psaList.add(psaRecord);
    }
    insert psaList;
    //insert accList;
    //Convert Sobject to String to pass to Future method to create account
    String records = JSON.Serialize(accList);
    AccountHelperAsyncApex.accountCreate(records);
    
}