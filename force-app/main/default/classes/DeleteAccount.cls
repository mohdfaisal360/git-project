// Class to delete those account those have less than or equal to 2 contact
// Owner: Mohd Faisal
public class DeleteAccount {
    //To check Accounts those have contact less or 2 than delete the accounts
    public static void deleteAccountHavingTwoCon(){
        try{
            List<Account> accountList = [select Id,Name,(select Id, LastName from Contacts) from Account Limit 50];
            List<Account> accountsToBeDelete = new List<Account>();
            for(Account accObj:accountList){
                if(accObj.Contacts.size()<=2){
                    accountsToBeDelete.add(accObj);
                }
            }
            if(!accountsToBeDelete.isEmpty()){
                List<Database.DeleteResult> getDeletedAccount = Database.delete (accountsToBeDelete,false);
                
                integer count = 0;
                for(Database.DeleteResult getAcc :getDeletedAccount){
                    if(getAcc.isSuccess()){
                        count++;
                    }
                }
            }
            List<User> userList = [select Id, Email, CreatedDate from User where Profile.Name = 'System Administrator' ORDER BY CreatedDate LIMIT 1];
            Messaging.SingleEmailMessage mailToorgOwner = new Messaging.SingleEmailMessage();
            mailToorgOwner.toaddresses=new List<String>{userList[0].Email};
            mailToorgOwner.setSubject('N numbers Of Account has been Deleted Because they have less number of contacts');
            mailToorgOwner.setPlainTextBody('This is to inform you that a new Case has been created with following details');
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mailToorgOwner},false);
            
        }catch(Exception x){
            system.debug('getMessage' + x.getMessage() + x.getLineNumber());
        }
    }
}