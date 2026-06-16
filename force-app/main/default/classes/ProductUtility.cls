public class ProductUtility {
    
    public static decimal calculateDiscount(Decimal salaryAmount)
    {
     	Decimal Discount = 0;
        if (salaryAmount >=200000)
        {
            Discount = salaryAmount*(20.0/100);
         }
         else if (salaryAmount >=100000)
        {
             Discount = salaryAmount*(10.0/100);
         }
        else 
        {
            Discount = 20;
        }
     	return Discount;     
    }

}