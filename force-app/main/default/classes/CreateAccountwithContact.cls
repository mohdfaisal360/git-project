//When a is account  created then a contact create with data
//Author: Mohd Faisal
public class CreateAccountwithContact {
    //Create a contact when account is created 
    public static void creatingContactasNewAccountCreated(){
        try{
            List<Account> newAccountList = new List<Account>();
            for(integer i=0;i<1;i++){
                Account newAccount = new Account();
                newAccount.Name = 'Test New Account';
                newAccount.Only_Default_CheckBox__c = False;
                newAccountList.add(newAccount);
            }
            if(!newAccountList.isEmpty()){
                insert newAccountList;
            }
            
            List<Contact> newContactList = new List<Contact>();
            for(Integer k=0;k<1;k++){
                Contact newContact = new Contact();
                newContact.LastName = 'Default';
                newContact.FirstName = 'Info';
                newContact.Email = 'info@websitedomain.ltd';
                newContact.AccountId = newAccountList[0].Id;
                newContactList.add(newContact);
            }
            if(!newContactList.isEmpty()){
                insert newContactList;
            }
            
            if(!newAccountList.isEmpty()){
                newAccountList[0].Only_Default_CheckBox__c = True;
                update newAccountList;
            }
            
            
        }Catch(Exception x){
            system.debug('Get Message' +x.getMessage() +x.getLineNumber());
        }
    }
}