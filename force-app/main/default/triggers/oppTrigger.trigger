trigger oppTrigger on Opportunity (after insert) {
        set<id> accIds = new set<id>();
        Map<Id,Opportunity> oldMap = new Map<Id,Opportunity>();
        List<OpportunityContactRole> delcontactOpportunity = new List<OpportunityContactRole>();
        for(Opportunity opp : Trigger.new){
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