public class OpportunitywithProduct {
    public static void checkProduct(List<Opportunity> listofopportunity,Map<Id,Opportunity> oldMap){
        Map<id,List<Opportunity>> accountMapwithopportunity = new Map<id,List<Opportunity>>();
        
        set<Id> accountIds = new set<Id>();
        for(opportunity opp : listofopportunity){
            if(opp.AccountId!=null && opp.StageName!=oldMap.get(opp.Id).StageName){
                accountIds.add(opp.AccountId);
            }
        }
       
        List<Opportunity> opportunitywithproduct = [select Id,AccountId,StageName,HasOpportunityLineItem,(select Id from OpportunityLineItems) from Opportunity 
                                                    where AccountId IN:accountIds AND StageName = 'Closed Won' AND HasOpportunityLineItem=True];
        for(Opportunity newOpportunity:opportunitywithproduct){
            if(newOpportunity.OpportunityLineItems !=null){
                if(!accountMapwithopportunity.containskey(newOpportunity.AccountId)){
                    accountMapwithopportunity.put(newOpportunity.AccountId, new List<Opportunity>());
                }else{
                    accountMapwithopportunity.get(newOpportunity.AccountId).add(newOpportunity);
                }
            }
        }
        
        
    }
}