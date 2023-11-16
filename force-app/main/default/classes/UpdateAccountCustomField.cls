//Class to update account Field
//Author: Mohd Faisal
public class UpdateAccountCustomField {
    //to check contact on account
    public static void updateAccountField(List<Contact> listOfContact){
        try{
            set<Id> accountId = new set<Id>();
            for(Contact newcontact :listOfContact){
                accountId.add(newcontact.AccountId);
            }
            
            List<Account> listToCheckContact = [select Id,Only_Default_CheckBox__c,(select Id,LastName from Contacts)
                                               from Account where Id IN:accountId];
            List<Account> newAccountList = new List<Account>();
            if(listToCheckContact!=null){
                
                for(Account acc : listToCheckContact){
                    
                    if(acc.Contacts!=null && acc.Contacts.size()>0){
                        
                        acc.Only_Default_CheckBox__c = False;
                        newAccountList.add(acc);
                    }
                }
                update newAccountList;
            }
        } catch(Exception x){
            system.debug('Get Message' + x.getMessage() + x.getLineNumber());
        }
    }
}