public class TopXDesigantion {
    public static void updateOpportunity(List<Top_X_Designation__c> listOfTop){
        set<Id> oppId = new set<Id>();
        map<Id,String> mapoftrue = new map<Id,String>();
        map<Id,String> mapoffalse= new map<Id,String>();
        for(Top_X_Designation__c top:listOfTop){
            if(top.Opportunity__c!=Null && top.Document_Attached__c==True && top.Type__c=='Contract Flow Down' ){
                mapoftrue.put(top.Opportunity__c,top.Id);
                oppId.add(top.Opportunity__c);
            }
            else if(top.Opportunity__c!=Null && top.Document_Attached__c==True && top.Type__c=='Handoff'){
                mapoffalse.put(top.Opportunity__c,top.Id);
                oppId.add(top.Opportunity__c);
            }
        }
        List<Opportunity> listToUpdate =[select id,Handoff_Attached__c,CloseDate,StageName from Opportunity where Id IN:oppId];
        for(Opportunity opp :listToUpdate ){
            if(mapoftrue.containskey(opp.Id)){
                opp.Handoff_Attached__c ='True';
            }else if(mapoffalse.containskey(opp.Id)){
                opp.Handoff_Attached__c ='No';
            }
        }
        if(!listToUpdate.isEmpty()){
            update listToUpdate;
        }
    }
}