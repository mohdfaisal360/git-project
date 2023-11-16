public class SelfLookupQuestion {
    public static void selfLookup(List<Enquiry__c> childList,Map<Id,Enquiry__c> oldMap){
        set<Id> parentId = new set<Id>();
        for(Enquiry__c enq : childList){
            if(enq.Child_Enquiry__c!=Null && enq.Status__c=='Open' && enq.Status__c!=oldMap.get(enq.Id).Status__c){
                parentId.add(enq.Id);
            }
        }
    }
}