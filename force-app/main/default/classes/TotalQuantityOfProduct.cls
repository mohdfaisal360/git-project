//Class to get Total Quantity
//Author : Mohd Faisal
public class TotalQuantityOfProduct {
    // method to get total quantity of Product on Account
    public static void getTotalQuantityOfProductOnAccount(){
        
        List<Opportunity> QuantityOfProduct = [select Id,Account.Name,(select Id,Quantity from OpportunityLineItems)
                                               from Opportunity where Account.Working_In__c = 'Asia'];
        Decimal totalQuantityofProduct =0;
        
        if(QuantityOfProduct!=null){
            for(Opportunity opportunityList : QuantityOfProduct){
                if(opportunityList.OpportunityLineItems!=null){
                    for(OpportunityLineItem opportunityItems : opportunityList.OpportunityLineItems){
                        totalQuantityofProduct = opportunityItems.Quantity;
                    } 
                }
            }
        }
        
        system.debug('Total Quantity' + totalQuantityofProduct);
    }
}