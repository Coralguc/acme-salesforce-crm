@isTest
public class UserTriggerTest {
    
    @isTest
    public static void testUserCreation()
    {
        //1.Fire user Trigger - Create a User
        //Profile
        Test.startTest();
        
        // Get a Profile
        Profile prof = [
            SELECT Id
            FROM Profile
            WHERE Name = 'Standard User'
            LIMIT 1
        ];
        
        // Create User
        User newUser = new User(
            FirstName = 'Ligara',
            LastName = 'XElon',
            Email = 'ligara.xelon@test.com',
            Username = 'Ligara.xelon' + System.currentTimeMillis() + '@test.com',
            Alias = 'lxelon',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            ProfileId = prof.Id
        );
        
        insert newUser;
        
        Test.stopTest();
        
        //2. Assert Account Record
        List<Account> accList = [Select id from Account where Name = 'XElon'];
        Assert.areEqual(1, accList.size(), 'Unable to create Account');
        
        //3.Assert Permission set assignment
        PermissionSet pset = [select Id from PermissionSet 
                              where name = 'Common_User_PermissionSet'];
        List<PermissionSetAssignment> psaList = [Select id from 
                                                 PermissionSetAssignment 
                                                 where AssigneeId = :newUser.Id AND
                                                 PermissionSetId = :pset.Id];
        Assert.areEqual(1, psaList.size(), 'Unable to create Account');
        
        
    }  
}