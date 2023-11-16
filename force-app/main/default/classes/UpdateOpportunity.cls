// Having a class to update opportunity Name
// Author : Mohd Faisal
public class UpdateOpportunity {
    // method to check date to update the name
    public static void toCheckFutureDate(){
        try{
            List<Opportunity> listtoUpdate = new List<Opportunity>();
            List<Opportunity> oppList = [select Id,Name,StageName,CloseDate from Opportunity where CloseDate > today LiMIT 10];
            for(Opportunity opp :oppList){
                opp.Name = 'Opportunity Name' + 'F';
                opp.StageName = 'Prospecting';
                listtoUpdate.add(opp);
            }
            if(!listtoUpdate.isEmpty()){
               update listtoUpdate;
            }
        }catch(Exception x){
            system.debug('get Message' + x.getMessage());
        }
    }
}