public class CreateOpportunityAsynch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select Id from Opportunity Limit 4');
    }
    public void execute(Database.BatchableContext bc,List<Opportunity> listOfOpportunty){
        AsynchCreateOpoortunity.createOpoortunity();
    }
    public void finish(Database.BatchableContext bc){
        
    }
}