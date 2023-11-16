public class TotalAmount {
    public static void getAmount(List<Account> listOfAccount){
        set<Id> accIds = new set<Id>();
        Map<Id,Decimal> mapOfAccount = new Map<Id,Decimal>();
        for(Account acc : listOfAccount){
            acc.totalQuantity__c=0;
            accIds.add(acc.Id);
            mapOfAccount.put(acc.Id,acc.totalQuantity__c);
        }
        
        for(Opportunity opp :[select Id,AccountId,Amount from Opportunity where Id IN:accIds]){
            if(opp.Amount!=Null){
                mapOfAccount.put(opp.AccountId,mapOfAccount.get(opp.AccountId)+opp.Amount);
            }
        }
        List<Account> updateableList = new List<Account>();
        for(Account acc : listOfAccount){
            acc.totalQuantity__c = mapOfAccount.get(acc.Id);
            updateableList.add(acc);
        } 
        /*if(!updateableList.isEmpty()){
            update updateableList;
        }*/
    }
}