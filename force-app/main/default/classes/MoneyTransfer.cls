public class MoneyTransfer {
    public static void checkValidation(List<Money_Transfer__c> listOfMoney){
        try{
            
            List<Account> accountsToUpdate = new List<Account>();
            Date currentDate = Date.today();
            
            for (Money_Transfer__c money : listOfMoney) {
                if(money.Transfer_Mode__c == 'Cheque' &&(money.FromAccountNo__c == null || money.ToAccountNo__c == null || money.Transfer_Date__c < system.today()+45)){
                    money.Status__c = 'Failed';
                    money.addError('Required field Can Not Be Null');
                }
                
                else if(money.Transfer_Mode__c == 'UPI mode' && (money.To_UPI_Id__c == null || money.From_UPI_Id__c == null)){
                    money.Status__c = 'Failed';
                    money.addError('Required Field Can Not Be Null');
                }
                
                else if(money.Transfer_Mode__c =='Cash Deposit' &&(money.ToAccountNo__c == null || money.To_Account_Holder_Name__c == null)){
                    money.Status__c = 'Failed';
                    money.addError('Required Field Can Not Be Null');
                }
                
                
                if (money.FromAccountNo__c != null && money.Amount__c != null) {
                    Account fromAccount = [SELECT Amount__c FROM Account WHERE Id = :money.FromAccountNo__c];
                    if (fromAccount.Amount__c < money.Amount__c) {
                        money.Status__c = 'Failed';
                        money.addError('Transfer amount exceeds the available balance in the From Account');
                    } 
                    else {
                        fromAccount.Amount__c = money.Amount__c;
                        accountsToUpdate.add(fromAccount);
                    }
                }
            }
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }catch(Exception Ex){
            system.debug('get errors'+Ex.getMessage()+'get Line Number'+Ex.getLineNumber());
        }
    }
}