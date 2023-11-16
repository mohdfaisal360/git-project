//Trigger Handler
public class AccountHandler {
    public static void handlerClass(List<Account> accList,Map<Id,Account> oldMap){
        List<Opportunity> listToUpdate = new List<Opportunity>();
        Map<Id,Account> accToMap = new Map<Id,Account>();
        for(Account acc:accList){
            if(acc.Active__c== 'No' && acc.Active__c != oldMap.get(acc.Id).Active__c){
                accToMap.put(acc.Id,acc);
                system.debug('accToMap>>>>'+accToMap);
            }
        }
        for(Opportunity opp:[select Id,AccountId,StageName from Opportunity where AccountId IN:accToMap.keyset()]){
            if(accToMap.containskey(opp.AccountId) && opp.StageName !='Closed Won' && opp.StageName !='Closed Lost'){
                opp.StageName = 'Closed Lost';
                listToUpdate.add(opp);
            }
        }
        system.debug('listToUpdate>>>'+listToUpdate);
        if(!listToUpdate.isEmpty()){
            update listToUpdate; 
        }
      
    }
}