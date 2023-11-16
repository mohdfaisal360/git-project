//Quetion :  Not allow more than 10 cloesd won opportunities in a single user and update total number of closed and open opportunities in a custom user field.
//Sprint: when we update opportunity record and that is 11th  than update there owner to any user that don't contains more than 10 opportunities.
//Sprint:shoot an email to the previous and after owner
//Author: Mohd Faisal        
public class ClassOfOpportunityHandler {
    public static void myMethod(List<Opportunity> listOfOpportunity,Map<id,Opportunity> oldMap){
        
        try{ 
            Map<Id,Integer> mapToCountOpportunity = new Map<Id,Integer>();
            set<Id> userId = new set<Id>();
            set<Id> setOfIds = new set<id>();
            for(Opportunity opp :listOfOpportunity){
                if(opp.OwnerId!=null && opp.StageName!=null && opp.StageName!=oldMap.get(opp.Id).StageName){
                    setOfIds.add(opp.OwnerId);
                }
            }
            //fetching system Administrator profile
            List<Profile> listOfProfile =[select Id from Profile where Name='System Administrator'];
            for(Profile pro :listOfProfile){
                userId.add(pro.Id);
            }
            //fetch user who have system admin profile
            List<User> listOfUser = [select Id,Closed_Opportunities__c,Open_Opportunities__c, isActive from User where ProfileId =:userId];
            
            List<AggregateResult> resulstOfOpportunity = [select  OwnerId, Count(Id)countCWopp from Opportunity 
                                                          where OwnerId IN:setOfIds  GROUP BY OwnerId];
            for(AggregateResult result : resulstOfOpportunity){
                if(!mapToCountOpportunity.containskey((id)result.get('OwnerId'))){
                    mapToCountOpportunity.put((id)result.get('OwnerId'),(integer)result.get('countCwopp'));
                } 
            }
            
            integer countopportunity=0;
            for(Opportunity newOpportunity : listOfOpportunity){
                countopportunity =mapToCountOpportunity.get(newOpportunity.OwnerId);
                if(countopportunity>10){
                    for(User usr :listOfUser){
                        if(!mapToCountOpportunity.containskey(usr.Id) && mapToCountOpportunity.get(newOpportunity.OwnerId) <10){
                            newOpportunity.OwnerId = usr.Id;
                        }
                    } 
                }
            }
            if(countopportunity<=10){
                for(User u :listofuser){
                    
                }
            }
        }catch(Exception x){
            system.debug('Get Error Message' + x.getMessage() + x.getLineNumber());
        }
    }
}