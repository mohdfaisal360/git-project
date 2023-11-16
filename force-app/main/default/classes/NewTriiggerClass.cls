public class NewTriiggerClass {
    public static void createRecord(List<OpportunityLineItem> listOfOpportunityLI){
        set<Id> opportunityIds = new set<Id>();
        set<Id> productIds = new set<Id>();
        for(OpportunityLineItem newOLI :listOfOpportunityLI){
            if(newOLI.OpportunityId!=null && newOLI.Product2Id!=null){
                opportunityIds.add(newOLI.OpportunityId);
                productIds.add(newOLI.Product2Id);
            }                
        }
        List<Opportunity> listOfOpportunity = [SELECT Id, Name,Product_type__c from Opportunity Where Id IN:opportunityIds];
        Map<Id,String> mapOfOpportunity = new Map<Id,String>();
        if(listOfOpportunity!=null){
            for(Opportunity opp : listOfOpportunity){
                mapOfOpportunity.put(opp.Id,opp.Product_type__c);
            } 
        }
        List<Product2> listOfProduct = [select Id ,Name ,Family from product2 where Id IN:productIds];
        Map<Id,String> mapofProduct = new  Map<Id,String>();
        if(listOfProduct!=null){
            for(Product2 pro : listOfProduct){
                mapofProduct.put(pro.Id,pro.Family);
            }
        }
        
        for(OpportunityLineItem newitem : listOfOpportunityLI){
            if(mapofProduct.containskey(newitem.Product2Id) && mapOfOpportunity.containskey(newitem.OpportunityId)){
                String productvalue = mapofProduct.get(newitem.Product2Id);
                String Opportunityvalue = mapOfOpportunity.get(newitem.Product2Id);
                
                if(productvalue!=Opportunityvalue){
                    newitem.addError('Values of piclist are not same');
                }
                else{
                    insert newitem;
                }
            }
        }
    }
}