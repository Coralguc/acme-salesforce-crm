public class CourseMapDemo {
    
    static Map<String,List<String>> CoursesMap = new  Map<String,List<String>>();
    //key: Coursetype, Value : List<String> Courses
    public static void setCourseData(String courseType, String courseName)
    {
       // Check Key exists
       if (CoursesMap.containsKey(courseType))
       {
           //get Value(List) from Mao and add new course into the List
           CoursesMap.get(courseType).add(courseName);
       }
        else
        {
            //Create a List and add  the Course in to Map, List created without Variable
            CoursesMap.Put(courseType, new List<String>{courseName});
        }
    }
    public static void displayAllCourses()
    {
       for(String CourseType:CoursesMap.keySet())
       {
           system.debug('======================');
           system.debug(courseType);
           system.debug('======================');
       
           for(String course:CoursesMap.get(CourseType))
           {
               System.debug(Course);
           }
    }
    }
    
    //display a single Course
    public static void displaySingleCourse(String CourseType)
    {
        if(CoursesMap.containsKey(courseType))
        {
            for(String course:CoursesMap.get(CourseType))
           {
               System.debug(Course);
           }
        }
            else
            {
                system.debug('CourseType doesnt exist');
             }
                
             
        }
                             
}