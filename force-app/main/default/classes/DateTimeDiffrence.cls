//class to check diffrence between time
//Author: Mohd Faisal
public class DateTimeDiffrence {
    // to check difreence between year,month,day,hour and minute  
    public static void tocheckDiffrence(){
        try{
            DateTime endDateTime = DateTime.newInstance(2026, 03, 01, 03, 01, 12);
            DateTime startDateTime = DateTime.newInstance(2016, 01, 05, 07, 08, 55);
            
            Long millidiffrence = math.abs(endDateTime.getTime() - startDateTime.getTime());
            
            DateTime getDiffTime = DateTime.newInstance(millidiffrence);
            
            DateTime findDiff = DateTime.newInstance(getDiffTime.year()-1970,
                                                     getDiffTime.month()-1,
                                                     getDiffTime.day()-1,  
                                                     getDiffTime.hour(),
                                                     getDiffTime.minute(),
                                                     getDiffTime.second());
            System.debug(findDiff); 
        }catch(Exception x){
            system.debug('get Message' + x.getMessage());
        }  
    }
}