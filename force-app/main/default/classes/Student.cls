public class Student {
	Integer Mark1;
    Integer Mark2; 
    Integer Mark3;
    Public Student(Integer Mark1, Integer Mark2, Integer Mark3)
    {
        this.Mark1 = Mark1;
        this.Mark2 = Mark2;
        this.Mark3 = Mark3;
    }
    Public void calculateResult()
    {
        Integer Total =  Mark1+Mark2+Mark3;
        Decimal Average = Total/3.0;
        
        if (Mark1 >=35 && Mark2 >=35 && Mark3 >= 35)
        {
            system.debug('Student Pass');
        }
        else
        { 
            system.debug('Student Fail');
        }
       if (Average >=90)
       {
          system.debug(' Grade: A');
       }
         else if (Average >=80 && Average < 90)
       {
          system.debug(' Grade: B');    
       }
        else if (Average >=60 && Average < 80)
       {
          system.debug(' Grade: C');    
       }
    	else if (Average >=50 && Average < 60)
       {
          system.debug(' Grade: D');    
       }
        else
        {
             system.debug(' Grade: E');    
        }
    }
    }