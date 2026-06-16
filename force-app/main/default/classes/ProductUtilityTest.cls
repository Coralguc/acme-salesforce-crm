@isTest
public class ProductUtilityTest {    
	
	@isTest
	public static void testCalculateDiscount() 
    {
        Decimal discount = ProductUtility.calculateDiscount(300000);
        Assert.areEqual(60000, discount,'Wrong Calculation');
    }
	
    @isTest
    public static void testCalculateDiscount1() 
    {
        Decimal discount = ProductUtility.calculateDiscount(150000);
        Assert.areEqual(30000, discount,'Wrong Calculation');
    }
	@isTest
    public static void testCalculateDiscount2() 
    {
        Decimal discount = ProductUtility.calculateDiscount(50000);
        Assert.areEqual(20, discount,'Wrong Calculation');
    }

}