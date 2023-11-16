// class to create a Contact with Email 
// Author: Mohd Faisal
public class CreateAnewContact {
    //Check related Account with Contact 
    public static void checkRelatedAccountToContact(List<Contact> contactList){
        try{
            set<Id> accountId = new Set<Id>();
            for(Contact newContact : contactList){
                if(newContact.AccountId!=null){
                    accountId.add(newContact.AccountId);
                }
            }
            
            List<Account> accountList =[select Id,Counter__c,Rating,
                                        (select Id,Contact_Rating__c,Email from Contacts) from Account where Id IN:accountId Limit 10];
            List<Contact> contactToUpdate = new List<Contact>();
            List<Account> accountToUpdate = new List<Account>();
            if(accountList!=null){
                for(Account accounts :accountList){
                    accounts.Counter__c = accounts.Contacts.size();
                    accountToUpdate.add(accounts);
                    if(accounts.Contacts!=null){
                        for(Contact contacts:accounts.Contacts){
                            contacts.AccountId = accounts.Id;
                            contacts.Email = 'test@360degreecloud.com';
                            contacts.Contact_Rating__c = accounts.Rating;
                            contactToUpdate.add(contacts);
                        }
                    }                    
                }
            }
            if(!contactToUpdate.isEmpty()){
                update contactToUpdate; 
            }
            if(!accountToUpdate.isEmpty()){
                update accountList;
             }
            //>>>>>>>>>>>>>>//
            set<id> accId = new set<Id>();
            Map<String,Id> accountMap1 = new Map<String,Id>();
            Map<String,Id> accountMap2 = new Map<String,Id>();
            for(Contact con : contactList){
                if(con.AccountId!=null && con.Email!=null){
                  accId.add(con.AccountId);
                }
                else If(con.AccountId==null){
                    accountMap1.put(con.Email,con.Id);
                    accountMap2.put(con.Name,con.Id);
                }
                    
                
            }          
            
                       
        }catch(Exception x){
            system.debug('Get Error Message' + x.getMessage() + x.getLineNumber());
        }
    }
}