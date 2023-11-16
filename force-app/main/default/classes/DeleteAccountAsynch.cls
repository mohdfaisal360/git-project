public class DeleteAccountAsynch implements Database.Batchable<sObject>{
    public  Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select Id, Name,CreatedDate from Account where CreatedDate >=LAST_N_DAYS :10');
        
    }
    public void execute(Database.BatchableContext bc,List<Account> listOfAccount){
        AsynchronousDeleteAccount.deleteAccountCreated(listOfAccount);
    }
    public void finish(Database.BatchableContext bc){
        
    }
}