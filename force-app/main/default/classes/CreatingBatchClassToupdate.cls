public class CreatingBatchClassToupdate  Implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select Id,Count__c,(select Id from Contacts) from Account]);
    }
    public void execute(Database.BatchableContext bc, List<Account> listOfAccount){
        UpdateCountFieldAsynch.updateAccountField(listOfAccount);
    }
    public void finish(Database.BatchableContext bc){
        
    }
}