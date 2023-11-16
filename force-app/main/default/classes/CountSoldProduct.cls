// Class having to count total number of sold product
// Author : Mohd Faisal
public class CountSoldProduct {
    // method to count sold product
    public static void showProduct(List<Opportunity> listOfOpportunity,Map<Id,Opportunity> oldMap){
        try{
            set<Id> oppId = new set<Id>();
            for(Opportunity oppObj : listOfOpportunity){
                if(oppObj.StageName =='Closed Won' && oppObj.StageName!=oldMap.get(oppObj.Id).StageName){
                    oppId.add(oppObj.Id);
                }
            }
            Map<Id,Decimal> mapwithProduct = new Map<Id,Decimal>();
            List<OpportunityLineItem> OLIList = [select Id,OpportunityId,Product2Id,Quantity from OpportunityLineItem where OpportunityId IN:oppId];
            for(OpportunityLineItem oli : OLIList){
                if(!mapwithProduct.containskey(oli.Product2Id)){
                    mapwithProduct.put(oli.Product2Id,oli.Quantity);
                }
                else if(mapwithProduct.containskey(oli.Product2Id)){
                    mapwithProduct.put(oli.Product2Id,mapwithProduct.get(oli.Product2Id)+oli.Quantity);
                }
            }  
            
            System.debug('mapwithProduct>>>>>>>>'+mapwithProduct);
            
            List<Product2> productList = [select Id,No_Of_Product_Sold__c from Product2 where Id IN:mapwithProduct.keyset()];
            
            Decimal count=0;
            for(Product2 proObj : productList){
                if(proObj.No_Of_Product_Sold__c!=null){
                    proObj.No_Of_Product_Sold__c=mapwithProduct.get(proObj.Id)+proObj.No_Of_Product_Sold__c;  
                } 
                else{
                    proObj.No_Of_Product_Sold__c=mapwithProduct.get(proObj.Id)+count;  
                }
                
            }
            system.debug('productList>>>'+productList);
            if(!productList.isEmpty()){
                update productList;
            }
            
            
        } catch(Exception ex){
            system.debug('Get Error'+ ex.getMessage() +ex.getLineNumber());
        }
    } 
    //method to get sold number when any updation happen
    public static void deletedOpportunitywithproduct(List<Opportunity> oldOpportunity){
        try{
            set<Id> deletedIds = new set<Id>();
            for(Opportunity oppObj : oldOpportunity){
                if(oppObj.StageName =='Closed Won'){
                    deletedIds.add(oppObj.Id);
                }
            }
            Map<Id,Decimal> mapOfProduct = new Map<Id,Decimal>();
            List<OpportunityLineItem> listOfOLI =[select Id,OpportunityId,Product2Id,Quantity from OpportunityLineItem where OpportunityId IN: deletedIds ALL ROWS];
            system.debug('listOfOLI>>>>>'+listOfOLI);
            for(OpportunityLineItem oliObj : listOfOLI){
                if(!mapOfProduct.containskey(oliObj.Product2Id)){
                    mapOfProduct.put(oliObj.Product2Id,oliObj.Quantity) ; 
                }
                else if(mapOfProduct.containskey(oliObj.Product2Id)){
                    mapOfProduct.put(oliObj.Product2Id,mapOfProduct.get(oliObj.Product2Id)+oliObj.Quantity);
                }
            }
            system.debug('mapOfProduct>>>>'+mapOfProduct);
            List<Product2> listToUpdate = [select Id,No_Of_Product_Sold__c from Product2 where Id IN:mapOfProduct.keyset()];
            for(Product2 pro : listToUpdate){
                pro.No_Of_Product_Sold__c =pro.No_Of_Product_Sold__c - mapOfProduct.get(pro.Id);
            }
            system.debug('listToUpdate>>>>'+listToUpdate);
            if(!listToUpdate.isEmpty()){
                update listToUpdate;
            }
            
        }Catch(Exception ex){
            system.debug('Get Message' +ex.getMessage());
        }
    }    
}