public class CreateingAnewClass {
    public static void myMethod(List<Opportunity> listofopportunity){
        Map<Id,Integer> countCloseOpportunities = new Map<Id,Integer>();
        Map<Id,Integer> countOpenOpportunities = new Map<Id,Integer>();
        List<Opportunity> listToChangeOwner = new List<Opportunity>();
        set<Id> OwnerIds = new set<Id>();
        for(Opportunity opp:listofopportunity){
            OwnerIds.add(opp.OwnerId);
        }
        
        for(Opportunity newOpportunity : [select Id,OwnerId,StageName from Opportunity where  OwnerId IN:OwnerIds]){
            if(newOpportunity.StageName=='Closed Won'){
                if(countCloseOpportunities.containskey(newOpportunity.OwnerId) && countCloseOpportunities.get(newOpportunity.OwnerId)<10){
                     countCloseOpportunities.put(newOpportunity.OwnerId,countCloseOpportunities.get(newOpportunity.OwnerId)+1);
                }else {
                    listToChangeOwner.add(newOpportunity);
                }
            }else{
                if(newOpportunity.StageName!='Closed Lost'){
                    countOpenOpportunities.put(newOpportunity.OwnerId,countOpenOpportunities.get(newOpportunity.OwnerId)+1);
                }
            }
        }
        List<User> listofuser = [select Id,Closed_Opportunities__c,Open_Opportunities__c, isActive from User where Id =:OwnerIds AND isActive=True];
        for(User usr:listofuser){
            usr.Closed_Opportunities__c = countCloseOpportunities.get(usr.Id);
            usr.Open_Opportunities__c = countOpenOpportunities.get(usr.Id);
        }
        if(listofuser.size()>0){
            system.debug(listofuser);
        }
        if(listToChangeOwner.size()>0){
            system.debug(listToChangeOwner);
        }
    }
    public static void updateowner(List<Opportunity> listofopportunity){
        Map<User,Decimal> mapToCount = new Map<User,Decimal>();
        List<User> listofuser = [select Id,Closed_Opportunities__c,Open_Opportunities__c, isActive from User where Closed_Opportunities__c<10 AND isActive=True];
        for(User usr :listofuser){
            mapToCount.put(usr,usr.Closed_Opportunities__c);
        }
        integer count = 0;
        for(Opportunity opp:listofopportunity){
            if(mapToCount.get(listofuser[count])<10){
                opp.OwnerId = listofuser[count].Id;
                mapToCount.put(listofuser[count],mapToCount.get(listofuser[count])+1);
            }else{
                count++;
                opp.OwnerId = listofuser[count].Id;
                mapToCount.put(listofuser[count],mapToCount.get(listofuser[count])+1);
            }
        }
        update listofopportunity;
        List<User> listtoupdate = new List<User>();
        listtoupdate.addAll(mapToCount.keyset());
        for(User u : listtoupdate){
            u.Closed_Opportunities__c = mapToCount.get(u);
        }
        update listtoupdate;
    }
}