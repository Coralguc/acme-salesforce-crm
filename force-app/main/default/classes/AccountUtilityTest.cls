@isTest
public class AccountUtilityTest {
    
	@isTest
        public static void TestgetAccounts()
        {
            List<Account> accList = new List<Account>();
            
            accList.add(new Account(Name='Test1', Rating='Hot', AnnualRevenue=200000, Phone = '8796578356'));
            accList.add(new Account(Name='Test1', Rating='Warm', AnnualRevenue=100000, Phone = '8726578356'));
             accList.add(new Account(Name='Test1', Rating='Hot', AnnualRevenue=300000, Phone = '8796548356'));
            insert accList;
                        
                 List<Account> accRecords = AccountUtility.getAccounts('Hot');
            
                 Assert.areEqual(2,accRecords.size(),'Unable to retrive account records');
                 
                 system.debug(accRecords);
            
        }
        

}