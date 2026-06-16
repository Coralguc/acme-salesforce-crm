public class courseHelper {

    //to store different courses
    
    static Map<String, List<Course>> coursesMap = new Map<String, List<Course>>();
    
    //add new course
    public static void setCoursedata(String courseType, String courseName, 
                  String courseDuration, Decimal courseFee)
    {
        Course courseRecord = new Course( courseType, courseName, 
               courseDuration,courseFee);
        //Check key exists or not 
        if(coursesMap.containsKey(courseType))
        {
           //Get the list of Course and add
            coursesMap.get(courseType).add(courseRecord);
        }
        else
        {
            coursesMap.put(courseType, new List<Course>{courseRecord});
        }
    }
    public static void displayAllCourses()
    {
        //values function - List<List<Course>
        for(String courseType :coursesMap.keySet())
        {
             system.debug('=============================');
             system.debug('Course Type ' + courseType);
              system.debug('=============================');
       //   for(List<Course> coursesList:coursesMap.values())  //will get all the values
          
         //   for(Course courseRecord:coursesList) // from courselist display the list of values every time the short term course was printed
           for(course CourseRecord :coursesMap.get(courseType))
            {
               // system.debug('=============================');
                //system.debug('Course Type' + courseRecord.courseType);
                //system.debug('=============================');
                system.debug(courseRecord.courseName + ':' +
                             courseRecord.courseDuration + ':' + 
                             courseRecord.courseFee);
            }
        }
            
    }
    
      public static void displayCourse(String courseType)
   		 {
        
        //Check if Course exists
        if(coursesMap.containsKey(courseType))
            {
                  system.debug('=============================');
                  system.debug(courseType + 'Courses are');
                  system.debug('=============================');
                
                for(Course courseRecord:CoursesMap.get(courseType))
                {
                  
                  system.debug(courseRecord.courseName + ':' +
                               courseRecord.courseDuration + ':' + 
                               courseRecord.courseFee);
                }
               
            }
         else
            {
                system.debug(CourseType +' course doesnot exists');
            }
         }
    
}