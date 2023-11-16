public class CreatingBatchFetchingLeadsAsynch Implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select Id,Phone,CreatedDate from Lead where CreatedDate=Yesterday AND Phone=Null]);
    }
    public void execute(Database.BatchableContext bc,List<Lead> listOfLead){
        FetchingLeadsAsynch.getLeadsNohavePhoneNumber(listOfLead);
    }
    public void finish(Database.BatchableContext bc){
    }
}