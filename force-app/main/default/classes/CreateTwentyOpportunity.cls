// Having a class to create twenty opportunity
// Author: Mohd Faisal
public class CreateTwentyOpportunity {
    //method to create opportunity with filed value
    public static void oppToCreateWithField(){
        try{
            List<Opportunity> listToInsert = new List<Opportunity>();
            for(Integer i = 1; i<=20; i++){
                Opportunity opp = new Opportunity();
                opp.Name = 'Test Opportunity' + i;
                opp.StageName = 'Prospecting';
                opp.CloseDate = system.today();
                listToInsert.add(opp);
            }
            if(!listToInsert.isEmpty()){
               insert listToInsert; 
            }
            
        }catch(Exception x){
            system.debug('get Message' + x.getMessage());
        }
    }
}