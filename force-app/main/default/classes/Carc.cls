public class Carc {
    
   String Brand;
   String Model;
    
  Public Carc(String Brand, String Model) //Constructor
  {
      this.Brand = Brand;
      this.Model = Model;          
  }

Public void Start()
   { 
	system.debug(Brand +'' + Model + ' Starts');
    }
    
 Public void Stop()
   { 
	system.debug(Brand +'' + Model + ' Stops');
    }
}