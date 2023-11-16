public class AsynchAddressBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,BillingCountry,BillingState from Account where BillingCountry=\'USA\' AND BillingState=Null');
    }
    public void execute(Database.BatchableContext bc,List<Account> listOfAccount){
        AsynchPopulateAddress.populateBillingAddress(listOfAccount);
    }
    public void finish(Database.BatchableContext bc){
        
    }
}