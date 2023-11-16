public class AsynchCreateOpoortunity {
    public static void createOpoortunity(){
        List<Opportunity> listToInsert = new List<Opportunity>();
        for(integer i=1;i<=5;i++){
           Opportunity oppObj = new Opportunity();
           oppObj.StageName ='Prospecting';
           oppObj.CloseDate = system.today();
           oppObj.Name = 'Asynch Opportunity' + i; 
            listToInsert.add(oppObj);
        }
        if(!listToInsert.isEmpty()){
            insert listToInsert;
        }
    }
}