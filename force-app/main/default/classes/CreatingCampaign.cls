public class CreatingCampaign {
    public static void methodtocount(List<Campaign> listOfCampaign,Map<Id,Campaign> oldMap){
        system.debug('oldMap>>'+oldMap);
        Set<Id> Ids = new Set<Id>();
        for(Campaign camObj : listOfCampaign){
            if(camObj.Status=='Completed' && camObj.Status!=oldMap.get(camObj.Id).Status){
                System.debug('camObj.Id'+camObj.Id);
                Ids.add(camObj.Id);
            }
        }
        system.debug('Ids'+Ids);
        Map<Id,Account> accListToUpdate = new Map<Id,Account>();
        List<Opportunity> oppList =[select Id,AccountId,CampaignId,Amount from Opportunity where AccountId!=Null AND Amount!=Null AND CampaignId IN:Ids];
        system.debug('opList'+oppList);
        for(Opportunity opp :oppList){
            if(!accListToUpdate.containskey(opp.AccountId)){
                accListToUpdate.put(opp.AccountId, new Account(Id =opp.AccountId,totalQuantity__c=opp.Amount));
            }
            else{
                accListToUpdate.get(opp.AccountId).totalQuantity__c+=opp.Amount;
            }
        }
        if(accListToUpdate.values()!=Null){
            update accListToUpdate.values();
        }
    }
}