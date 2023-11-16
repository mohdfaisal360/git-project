// Class to get Total Hour
// Author : Mohd Faisal
public class TotalHourOfPlan {
    //total hour based on travel location
    public static void getTotalHourofTravelLocation(){
        try{
            List<AggregateResult>  travelHour =  [select Sum (Travel_Hours__c) from Plan__c Where Travel_Location__c INCLUDES ('A','F')];
            
            
            system.debug('Total Hour'+ travelHour);
        }catch(Exception x){
            system.debug('Get Error' + x.getMessage());
        }
    }
}