//Class To Update Opportunity StageName ig It has Opportunity Line Item and Campaign Status field is Completed
//Author : Mohd Faisal
public class CampaignHandlerClass {
    // Method to update Opportunity stagename after insert of Campaign
    public static void updateOpportunityAfterInsert(List<Campaign> listOfCampaign){
        try{
            Map<String,Id> mapOfCampaignDomain = new Map<String,Id>();
            for(Campaign campObj :listOfCampaign){
                if(campObj.Status=='Completed' && campObj.Email__c!=Null){
                    String Domain = campObj.Email__c.substringBetween('@','.');
                    mapOfCampaignDomain.put(Domain,campObj.Id);
                }
            }
            List<Opportunity> listToInsert = new List<Opportunity>();
            List<Opportunity> listOfOpportunity = [select id,CampaignId,Name,HasOpportunityLineItem,Email__c from Opportunity where  CampaignId=Null AND Email__c!=Null];
            for(Opportunity oppObj : listOfOpportunity){
               String newDomain =  oppObj.Email__c.substringBetween('@','.');
                if(mapOfCampaignDomain.containskey(newDomain)){
                    oppObj.CampaignId =mapOfCampaignDomain.get(newDomain);
                }
                listToInsert.add(oppObj);
            }
            if(!listToInsert.isEmpty()){
                insert listToInsert;
            }
            
        }Catch(Exception Ex){
            system.debug('Get Message'+Ex.getMessage());
        }
    }
    public static void updateOpportunityStage(List<Campaign> listOfCampaign,Map<Id,Campaign> oldMap){
        try{
            List<Opportunity> listToUpdate = new List<Opportunity>();
            set<Id> idsOfCampaign = new set<Id>();
            for(Campaign camObj:listOfCampaign){
                if(camObj.Status=='Completed' && camObj.Status!=oldMap.get(camObj.Id).Status){
                    idsOfCampaign.add(camObj.Id);
                }
            }
            
            if(!idsOfCampaign.isEmpty()){
                List<Opportunity> listOfOpportunity = [select Id,CampaignId,StageName,HasOpportunityLineItem from Opportunity where CampaignId IN:idsOfCampaign];
                for(Opportunity oppObj : listOfOpportunity){
                    if(oppObj.HasOpportunityLineItem){
                        oppObj.StageName='Closed Won';
                        listToUpdate.add(oppObj);
                    }else{
                        oppObj.StageName='Closed Lost';
                        listToUpdate.add(oppObj);
                    }
                }
                if(!listToUpdate.isEmpty()){
                    update listToUpdate;
                }
            }
        }catch(Exception Ex){
            system.debug('Get Error Message'+Ex.getMessage());
        }
    }
}