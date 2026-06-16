public class temperatureConvertor {
	Integer Celsius;
    Decimal Fahrenheit;
    Public temperatureConvertor(Integer Celsius)
    {
       this.Celsius = Celsius;
        
        Fahrenheit = (Celsius * 9.0/5.0) + 32;
        
    }
    Public void display()
    {
        System.debug('Fahrenheit of Celsius ' +Celsius+ 'is ' + Fahrenheit);
    }
}