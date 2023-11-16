public class LinkCaseToContact {
    public static void caseToContact(List<Case> listOfCase,Map<Id,Case> oldMap){
        set<Id> caseId = new set<Id>();
        Map<Id,String> statusMap = new Map<Id,String>();
        List<Task> toUpdateTask = new List<Task>();
        for(Case ca :listOfCase){
            if(ca.AccountId!=Null && ca.Status!=Null && ca.Status!=oldMap.get(ca.Id).Status){
                caseId.add(ca.AccountId);
                statusMap.put(ca.Id,ca.Status);
            }
        }
        List<Task> listOfTask =[select Id,Status,WhatId from Task where WhatId IN:statusMap.keyset()];
        for(Task ta : listOfTask){
            string caseStatus;
            if(statusMap.containskey(ta.WhatId)){
                caseStatus=statusMap.get(ta.WhatId);
            }
            ta.Status = caseStatus;
            toUpdateTask.add(ta);
        }
        List<Account> listToUpdate = new List<Account>();
        Map<Id,Account> mapOfAccount = new Map<Id,Account>([select Id,Name,Description from Account where Id IN:caseId]);
        
        Map<Id,Case> newMapOfCase = new Map<Id,Case>();
        List<Case> newListOfCase =[select Id,AccountId,CaseNumber from Case where AccountId IN:caseId];
        for(Case newCa : newListOfCase){
            newMapOfCase.put(newCa.AccountId,newCa);
        }
        for(Account acc : mapOfAccount.values()){
            if(newMapOfCase.containskey(acc.Id)){
               Case latestCase = newMapOfCase.get(acc.Id);
               acc.Description = 'Latest CaseNumber Is' +latestCase.CaseNumber + 'Latest Status Is ' + latestCase.Status;
               listToUpdate.add(acc);
            } 
        }
        if(!toUpdateTask.isEmpty()){
            update toUpdateTask;
        }
        if(!listToUpdate.isEmpty()){
            update listToUpdate;
        }
    }
}