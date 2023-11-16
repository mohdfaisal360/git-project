public class CreateContractOverview {
    public static void contractCreate(List<Contract_Owerview__c> listOfContractOwerview){
        try{
            List<Subs_Serviced_On_Contract__c> listToInsert = new List<Subs_Serviced_On_Contract__c>();
            for(Contract_Owerview__c con :listOfContractOwerview){
                List<String> piclistValue = con.Status_On_Contract__c.split(';');
                
                system.debug('piclistValue'+piclistValue);
                for(String value : piclistValue){
                    Subs_Serviced_On_Contract__c newrecord = new Subs_Serviced_On_Contract__c();
                    newrecord.ContractId__c = con.Id;
                    newrecord.Contract_Year__c = value;
                    newRecord.Name = con.Name;
                    listToInsert.add(newrecord);
                }
            }
            system.debug('listToInsert'+listToInsert);
            if(!listToInsert.isEmpty()){
                insert listToInsert;
            }
        }catch(Exception Ex){
            system.debug('Get Error'+Ex.getMessage());
        }
    }
}