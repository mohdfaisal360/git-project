//Class to Insert Account's related Contact on opportunity contact role
//Author : Mohd Faisal
public class AddContactIntoContactRole {
    //Method to add Account related contact on opportuntycontactRole
    public static void addRelatedContactToOpportunityContactRole(List<Opportunity> listOfOpportunity){
        try{
            Map<Id,Opportunity> mapOfOpportunity = new Map<Id,Opportunity>();
            for(Opportunity oppObj : listOfOpportunity){
                if(oppObj.AccountId !=Null && oppObj.StageName == 'Closed Won'){
                    mapOfOpportunity.put(oppObj.AccountId,oppObj);
                }
            }
            List<OpportunityContactRole> listToInsert = new List<OpportunityContactRole>();
            List<Contact> contactList = [select Id,AccountId from Contact  where AccountId IN:mapOfOpportunity.Keyset()];
            if(contactList!=Null){
                for(Contact conObj : contactList){
                    OpportunityContactRole conRole = new OpportunityContactRole();
                    conRole.ContactId =conObj.Id;
                    conRole.OpportunityId= mapOfOpportunity.get(conObj.AccountId).Id;
                    listToInsert.add(conRole);  
                }
                if(!listToInsert.isEmpty()){
                    insert listToInsert;
                }
            }
            
        }Catch(Exception Ex){
            system.debug('Get Message' +Ex.getMessage());
        }
    }
    //Metod to insert contact role on Opportunity when stage Name update  
    public static void updateContactOnContactRole(List<Opportunity> listOfOpportunity,Map<Id,Opportunity> oldMap){
        try{
            Map<Id,Opportunity> mapOfOpportunity = new Map<Id,Opportunity>();
            for(Opportunity oppObj : listOfOpportunity){
                if(oppObj.AccountId !=Null && oppObj.StageName!=oldMap.get(oppObj.Id).StageName){
                    mapOfOpportunity.put(oppObj.AccountId,oppObj);
                }
            }
            system.debug('mapOfOpportunity'+mapOfOpportunity);
            List<OpportunityContactRole> listToUpdate = new List<OpportunityContactRole>();
            List<Contact> contactList =[select Id,AccountId from Contact  where AccountId IN:mapOfOpportunity.keyset()];
            if(contactList!=Null){
                for(Contact conObj :contactList){
                    OpportunityContactRole conRole = new OpportunityContactRole();
                    conRole.ContactId =conObj.Id;
                    conRole.OpportunityId= mapOfOpportunity.get(conObj.AccountId).Id; 
                    listToUpdate.add(conRole);
                }
                system.debug('listToUpdate'+listToUpdate);
                if(!listToUpdate.isEmpty()){
                    insert listToUpdate;
                }
            }
            
        }catch(Exception Ex){
            system.debug('Get Error'+Ex.getMessage());
        }
    }
}