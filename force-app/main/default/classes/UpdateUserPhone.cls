// Class to update user Phone number based Contact Phone
// Author : Mohd Faisal
public class UpdateUserPhone {
    //Method to Compare Opportunity and opportunityLineIem and Update User Phone 
    public static void updateUserPhoneBasedOnContactPhone(List<Opportunity> listofOpportunity){
        set<Id>acctIds= new set<Id>();
        if(ListOfOpportunity!=null){
            for(Opportunity newOpportunity:ListOfOpportunity){
                if(newOpportunity.AccountId!=null){
                    acctIds.add(newOpportunity.AccountId);
                }
            }
        }
        list<Opportunity>listOfOppo=[SELECT id, AccountId, Account.Name,(SELECT id From OpportunityLineItems ) from Opportunity WHERE StageName='Closed Won' And AccountId!=null];
        map<id,list<Opportunity>> mapOfOppoAcccountIds= new map<id,list<Opportunity>>();
        Map<Id,Integer> mapAccCountOfOpp= new Map<Id,Integer>();
        Map<Id,Integer> mapAccCountOfOppOLI= new Map<Id,Integer>();
        
        List<Opportunity> oppWithOLINotNull=new List<Opportunity>();
        for(Opportunity oo:listOfOppo){
            if( oo.OpportunityLineItems!=null){
                if(!mapOfOppoAcccountIds.containskey(oo.AccountId)){
                    mapOfOppoAcccountIds.put(oo.AccountId,new list<Opportunity>());
                }
                mapOfOppoAcccountIds.get(oo.AccountId).add(oo);
                oppWithOLINotNull.add(oo);
            }
        }
        List<Contact> accWithConPhoneList=[SELECT Id,AccountId, Name, Phone FROM Contact WHERE AccountId IN : mapOfOppoAcccountIds.keySet() AND Phone!=null];
        Map<Id,List<Contact>> mapAccWithConPhone= new Map<Id,List<Contact>>();
        for(Contact con:accWithConPhoneList){
            if(!mapAccWithConPhone.containskey(con.AccountId)){
                mapAccWithConPhone.put(con.AccountId,new List<Contact>());
            }
            mapAccWithConPhone.get(con.AccountId).add(con);
        }
        
        for(Opportunity oo2:oppWithOLINotNull){
            if(!mapAccCountOfOpp.containskey(oo2.AccountId) && mapAccWithConPhone.containskey(oo2.AccountId)){
                mapAccCountOfOpp.put(oo2.AccountId,mapOfOppoAcccountIds.get(oo2.AccountId).size());
            }
        }
        
        for(List<Opportunity> oppList: mapOfOppoAcccountIds.values()){
            for(Opportunity oo3:oppList){
                if(oo3.OpportunityLineItems.size()>0){
                    if(!mapAccCountOfOppOLI.containskey(oo3.AccountId) && mapAccWithConPhone.containskey(oo3.AccountId) && mapAccCountOfOpp.containskey(oo3.AccountId)){
                        mapAccCountOfOppOLI.put(oo3.AccountId,oo3.OpportunityLineItems.size());
                    }
                    else{
                        mapAccCountOfOppOLI.put(oo3.AccountId,mapAccCountOfOppOLI.get(oo3.AccountId)+oo3.OpportunityLineItems.size());
                    }
                }
            }
        }
        
        Integer countOpp=0;
        Integer countOppLI=0;
        Id accountFound;
        String conPhone;
        
        for(ID accIdTocheckGreater: mapAccCountOfOppOLI.keySet()){
            if(mapAccCountOfOpp.get(accIdTocheckGreater)>countOpp){
                countOpp=mapAccCountOfOpp.get(accIdTocheckGreater);
                countOppLI=mapAccCountOfOppOLI.get(accIdTocheckGreater);
                accountFound=accIdTocheckGreater;
            }
            else if(mapAccCountOfOpp.get(accIdTocheckGreater)==countOpp && mapAccCountOfOppOLI.get(accIdTocheckGreater)>countOppLI){
                countOpp=mapAccCountOfOpp.get(accIdTocheckGreater);
                countOppLI=mapAccCountOfOppOLI.get(accIdTocheckGreater);
                accountFound=accIdTocheckGreater;
            }
        }
        
        for(Contact contFound:accWithConPhoneList){
            if(contFound.AccountId==accountFound){
                conPhone=contFound.Phone;
            }
        }
        
        User user1=[SELECT Id, Phone FROM User WHERE Id =:UserInfo.getUserId()];
        if(user1!=null){ 
		    user1.Phone=conPhone;
            update user1;
        }
    
    }
}