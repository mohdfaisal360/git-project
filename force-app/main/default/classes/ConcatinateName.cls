public class ConcatinateName {
    public static void addLastNameInAccountName(List<Contact> contactList){
        try{
            set<Id> accIds = new set<Id>();
            for(Contact con : contactList){
                if(con.AccountId!=Null){
                    accIds.add(con.AccountId);
                }
            }
            Map<Id,Account> mapOfAccount = new Map<Id,Account>([select Id,Name from Account where Id IN : accIds]);
            
            for(Contact con :contactList){
                if(mapOfAccount.containskey(con.AccountId)){
                    mapOfAccount.get(con.AccountId).Name+='_'+ con.LastName;
                }
            }
            update mapOfAccount.values();
        }Catch(Exception ex){
            system.debug('get message'+ex.getMessage());
        }
    }
     //method to concatenate lastName on AccName on Update.
    public static void updateAccNamewithLastName(List<Contact> contactList,Map<Id,Contact> oldMap,Map<Id,Contact> newMap){
        try{
            set<Id> accIds = new set<Id>();
            for(Contact con : contactList){
                if ((con.AccountId!=Null && oldMap.get(con.Id).lastName!=con.lastName) 
                    || (con.AccountId==Null && con.AccountId!=oldMap.get(con.Id).AccountId) 
                    || (con.AccountId!=Null && con.AccountId!=oldMap.get(con.Id).AccountId )){
                        accIds.add(con.AccountId);
                        if(oldMap.get(con.Id).AccountId!=Null){
                            accIds.add(oldMap.get(con.Id).AccountId);
                        }
                        else if(con.AccountId==Null){
                            accIds.add(oldMap.get(con.Id).AccountId);
                        }
                    }
            }
            system.debug('accIds>>>>>'+accIds);
            List<Account> listOfAccount = [select Id,Name,(select Id,LastName from Contacts Order by CreatedDate Limit 100) from Account where Id IN:accIds];
            for(Account acc : listOfAccount){
                string originalName;
                string accNewName;
                for(Contact conObj : acc.Contacts){
                    if(oldMap.containskey(conObj.Id)){
                        accNewName=accNewName+newMap.get(conObj.Id).LastName+',';
                    }
                    else if(!oldMap.containskey(conObj.Id)){
                        accNewName=accNewName+conObj.LastName+',';
                    }
                }
                originalName = acc.Name.substringBefore(',');
                acc.Name = originalName + accNewName;
            }
            update listOfAccount;
            
        }catch(Exception x){
            system.debug('Get Message'+x.getMessage()+'On Line Number'+x.getLineNumber());
        }
    }
    ////////////////////////////////////////////////Method On delete 
    public static void concatConLastNameOnDelete(List<Contact> oldTrigger, Map<Id,Contact> oldMap){
        try{
            Set<Id> accIds=new Set<Id>();
            for(Contact newCon: oldTrigger){
                if(newCon.AccountId!=Null){
                    accIds.add(newCon.AccountId);
                }
            }               
            if(!accIds.IsEmpty()){
                List<Account> accListToUpdate=[SELECT Id, Name, (Select lastName, AccountId FROM Contacts Order BY CreatedDate ASC) FROM Account WHERE Id IN: accIds LIMIT 100];
                
                if(accListToUpdate!=Null && !accListToUpdate.IsEmpty()){
                    for(Account accToUpdate:accListToUpdate){
                        String accName;
                        String newAccName='-';
                        for(Contact conOfAcc:accToUpdate.contacts){
                            if(!oldMap.containskey(conOfAcc.Id)){
                                newAccName=newAccName+conOfAcc.lastName+',';
                            }
                        }
                        accName=accToUpdate.Name.subStringBefore('-');
                        
                        accToUpdate.Name=accName+newAccName;
                        
                    }
                    update accListToUpdate;
                }
            }
        }
        catch(Exception x){
            System.debug('Get Message'+x.getMessage()+'On Line Number'+x.getLineNumber());
        }
    }
    //method to concatenate lastName on AccName on Undelete.
    public static void concatConLastNameOnUndelete(List<Contact> newTrigger){
        try{
            Set<Id> accIds=new Set<Id>();
            for(Contact newCon: newTrigger){
                if(newCon.AccountId!=Null){
                    accIds.add(newCon.AccountId);
                }
            }               
            if(!accIds.IsEmpty()){
                List<Account> accListToUpdate=[SELECT Id, Name, (Select lastName, AccountId FROM Contacts Order BY CreatedDate ASC) FROM Account WHERE Id IN: accIds LIMIT 100];
                
                if(accListToUpdate!=Null && !accListToUpdate.IsEmpty()){
                    for(Account accToUpdate:accListToUpdate){
                        String accName;
                        String newAccName='-';
                        for(Contact conOfAcc:accToUpdate.contacts){
                            newAccName=newAccName+conOfAcc.lastName+',';
                        }
                        accName=accToUpdate.Name.subStringBefore('-');
                        
                        accToUpdate.Name=accName+newAccName;
                        
                    }
                    update accListToUpdate;
                }
            }
            
        }
        catch(Exception x){
            System.debug('Get Message'+x.getMessage()+'On Line Number'+x.getLineNumber());
        }
    } 
}