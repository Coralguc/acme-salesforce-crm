public class EmployeeMapDemo {

    static Map<Integer, String> employeeMap = new  Map<Integer, String>();
    
    public static void setEmployee(Integer empCode, String empName)
    {
        employeeMap.put(empCode,empName);
    }
    
    public static String getEmployee(Integer empCode)
    {
       if (employeeMap.containsKey(empCode))
       {
           return employeeMap.get(empCode);
       }
        else
        {
            return 'No employee exists with the code' +empCode;
        }          
    }
    
    public static void displayAllEmployee()
    {
        for(String emp:employeeMap.values())
        {
            system.debug(emp);
        }
    }
    public static void displayAllEmployeeNumbers()
    {
        for(Integer empNumber:employeeMap.KeySet())
        {
            system.debug(empNumber);
        }
    }
         
}