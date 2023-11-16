public class convertLead {
    public static void  converleadIn(List<Lead> listOfLead){
        set<Id> convertedId = new set<Id>();
        for(Lead leObj : listOfLead){
            if(leObj.isConverted){
                convertedId.add(leObj.Id);
            }
        }
        List<Account> listOfAccToUpdate = new List<Account>();
        List<Contact> listOfConToUpdate = new List<Contact>();
        List<Opportunity> listOfOppToUpdate = new List<Opportunity>();
        Map<Id,Lead> mapOfLead = new Map<Id,Lead>([select Id,ConvertedAccountId,ConvertedOpportunityId,
                                                  ConvertedContactId from Lead where Id IN:convertedId]);
        for(Lead leadObj : mapOfLead.values()){
            if(leadObj.ConvertedAccountId!=Null){
                Account acc = new Account();
                acc.Id =leadObj.ConvertedAccountId;
                acc.Active__c ='Yes';
                listOfAccToUpdate.add(acc);
            }
            if(leadObj.ConvertedContactId!=Null){
                Contact con = new Contact();
                con.Id = leadObj.ConvertedContactId;
                con.CheckBox__c = True;
                listOfConToUpdate.add(con);
            }
            if(leadObj.ConvertedOpportunityId!=Null){
                Opportunity opp = new Opportunity();
                opp.Id = leadObj.ConvertedOpportunityId;
                opp.Description = leadObj.Name;
                listOfOppToUpdate.add(opp);
            }
        }
        if(!listOfAccToUpdate.isEmpty()){
            update listOfAccToUpdate;
        }
        if(!listOfConToUpdate.isEmpty()){
            update listOfConToUpdate;
        }
        if(!listOfOppToUpdate.isEmpty()){
            update listOfOppToUpdate;
        }
    }
}