public class UpdateAccRelatedToCase {
    public static void updateAccount(List<Case> listOfCase,Map<Id,Case> oldMap){
        set<Id> accId = new set<Id>();
        for(Case caObj : listOfCase){
            if(caObj.AccountId!=Null && caObj.Status!=Null && caObj.Status!=oldMap.get(caObj.Id).Status){
                accId.add(caObj.AccountId);
            }
        }
        Map<Id,Integer> mapofcount = new Map<Id,Integer>();
        List<AggregateResult> result =[select AccountId,count(Id) caseCount from Case where AccountId IN:accId AND isClosed = true
                                       group by AccountId];
        for(AggregateResult agr : result){
            Id accountId = (id)agr.get('AccountId');
            integer countCase = (integer)agr.get('caseCount');
        }
    }
}