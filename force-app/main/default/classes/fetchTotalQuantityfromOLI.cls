public class fetchTotalQuantityfromOLI {
    public static void afterInsertMethod(List<Opportunity> oppList){
       set<Id> accId = new Set<Id>();
       List<OpportunityContactRole> contactRole = new List<OpportunityContactRole>();
       for(Opportunity opp :oppList){
           if(opp.AccountId!=null){
               accId.add(opp.AccountId);
           }  
        } 
        Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>();
        List<Account> accofOpportunity= [select id, Name, (select Id, Name from Opportunities) from Account where Id IN: accId];
        for(Account a : accofOpportunity){
            if(!a.Opportunities.isEmpty()){
                for(Opportunity Op : a.Opportunities){
                    oppMap.put(a.id, Op);
                }    
            }
        }
        
        List<Account> accofContacts = [select Id,Name,(select Id,Name from Contacts) from Account where Id IN:accId];
        for(Account acc:accofContacts){
            if(acc.Contacts !=null){
                for(Contact con :acc.Contacts){
                    if(oppMap.containskey(acc.Id)){ 
                            OpportunityContactRole conRole = new OpportunityContactRole();
                            conRole.OpportunityId= oppMap.get(acc.id).id;
                            conRole.ContactId = con.Id;
                            contactRole.add(conRole);
                    }
                }
            }
        }
        insert contactRole;
    }
    
    public static void afterUpdateMethod(list<Opportunity> newList, map<id,Opportunity> oldMap){
        set<id> accIds = new set<id>();
        List<OpportunityContactRole> delcontactOpportunity = new List<OpportunityContactRole>();
        for(Opportunity opp : newList){
            if(opp.AccountId!=null && opp.AccountId!=oldMap.get(opp.id).accountId){
                accIds.add(opp.AccountId);
            }
        }
        List<Opportunity> oppContactRole=[select Id,accountId,(select Id from OpportunityContactRoles) 
                                      from Opportunity where Id IN:accIds];
        Map<id,Opportunity> oppList = new Map<Id,Opportunity>();
        for(Opportunity Op :oppContactRole ){
            if(!Op.OpportunityContactRoles.isEmpty()){
                for(OpportunityContactRole conRole : Op.OpportunityContactRoles){
                    delcontactOpportunity.add(conRole);
                }
            }
            delete delcontactOpportunity;       
        }
        
        List<Account> accOpp =[select Id, Name,(select Id from Opportunities) from Account Where Id IN :accIds];
        for(Account acc:accOpp){
            if(acc.Opportunities !=null){
                for(Opportunity O : acc.Opportunities){
                    oppList.put(acc.Id,O);
                }
            }
        }
        List<Account> accContact =[select Id,Name,(select Id from Contacts) from Account where Id IN : accIds];
        for(Account a : accContact){
            if(a.Contacts !=null){
                for(Contact con : a.Contacts){
                    if(oppList.containskey(a.Id)){
                        OpportunityContactRole conRole = new OpportunityContactRole();
                        conRole.OpportunityId = oppList.get(a.id).id;
                        conRole.ContactId = con.Id;
                        delcontactOpportunity.add(conRole);
                    }
                }
            }
        }
        insert delcontactOpportunity;
        
     }  
     public static void afterUndeleteMethod(list<Opportunity> newList){
        List<Opportunity> undeleteOppList = new List<Opportunity>();
        for(Opportunity opp : newList){
            if(opp.accountId!=null){
                Opportunity newopp = new Opportunity();
                newopp.id = opp.id;
                newopp.AccountId= opp.AccountId;
                undeleteOppList.add(newopp);
                
            }
        }
        undelete undeleteOppList;   
        
    }
    
    public static void afterDeleteMethod(list<Opportunity> oldList){
        List<OpportunityContactRole> deleteOppRole = new List<OpportunityContactRole>();
        set<id> oppIds = new set<id>();
        for(Opportunity opp : oldList){
            if(opp.AccountId!=null){
                oppIds.add(opp.Id);
            }
        }
        
       
        List<Opportunity> oppList = [select id, (select id from OpportunityContactRoles) from Opportunity where id IN: oppIds];
        for(Opportunity opp : oppList){
        
            for(OpportunityContactRole opprole : opp.OpportunityContactRoles){
            
                deleteOppRole.add(opprole);
            }
        }
        delete deleteOppRole;
        
    }
}