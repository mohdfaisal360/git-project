public class Test_Quetion2 {
    public static void createAsset(List<Asset> listOfAsset){
        try{
            set<Id> accIds = new set<Id>();
            for(Asset asObj : listOfAsset){
                if(asObj.AccountId!=Null && asObj.IsCompetitorProduct==true){
                    accIds.add(asObj.AccountId);
                }
            }
            system.debug('accIds>>'+accIds);
            List<Asset> listToInsertNewAsset = new  List<Asset>();            
            Map<Id,Opportunity> mapOfOpportunity = new Map<Id,Opportunity>();
            List<Opportunity> listOfOpportunity  = [select Id,Name,AccountId,StageName,CloseDate from  Opportunity Where StageName ='Closed Won' AND AccountId!=Null 
                                                    AND AccountId IN:accIds LIMIT 200];
            system.debug('listOfOpportunity>>'+listOfOpportunity);
            for(Opportunity oppObj:listOfOpportunity){
                Asset newasObj = new Asset();
                newasObj.AccountId = oppObj.AccountId;
                newasObj.Name =  oppObj.Name;
                newasObj.IsCompetitorProduct= False;
                listToInsertNewAsset.add(newasObj);
            } 
            
            if(!listToInsertNewAsset.isEmpty()){
                insert listToInsertNewAsset;
            }
            system.debug('listToInsertNewAsset'+listToInsertNewAsset);
        }catch(Exception Ex){
            system.debug('get Message'+Ex.getMessage()+'get Line Number'+Ex.getLineNumber());
        }
    }
}