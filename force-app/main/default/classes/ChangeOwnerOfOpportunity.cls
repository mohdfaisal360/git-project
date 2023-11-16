// Class to Change the owner of the Opportunity and to update the custom field of User
// Author:Mohd Faisal
public class ChangeOwnerOfOpportunity {
    //Method to check  diffrent Opportunity and update their user Based on their Number
    public static void methodToChangeOwner(List<Opportunity> listOfOpportunity){ 
        try{ 
            
            set<Id> userId = new set<Id>();
            set<Id> setOfIds = new set<id>();
            for(Opportunity opp :listOfOpportunity){
                if( opp.StageName!=null ){
                    setOfIds.add(opp.OwnerId);
                }
            }
       
            //fetching system Administrator profile
            List<Profile> listOfProfile =[select Id from Profile where Name='System Administrator'];
            for(Profile pro :listOfProfile){
                userId.add(pro.Id);
            }
            
            //fetch user who have system admin profile
            Map<Id,User> mapOfUser = new Map<Id,User>([select Id,Closed_Opportunities__c,Open_Opportunities__c,UserName, isActive from User where ProfileId =:userId]);
            
            
            List<AggregateResult> resulstOfOpportunity = [select  OwnerId ownId, Count(Id) countopp from Opportunity 
                                                          where OwnerId IN:mapOfUser.keyset()  GROUP BY OwnerId];
            
            
            Map<Id,Integer> mapToCountOpportunity = new Map<Id,Integer>();
            for(AggregateResult result : resulstOfOpportunity){
                mapToCountOpportunity.put((id)result.get('ownId'),(integer)result.get('countopp'));
            }

            List<Opportunity> listToUpdate = new List<Opportunity>();
            for(Opportunity newOpportunity : listOfOpportunity){
                if(newOpportunity.OwnerId!=null && mapToCountOpportunity.containskey(newOpportunity.OwnerId)){
                    if(mapToCountOpportunity.get(newOpportunity.OwnerId)>=10){
                        for(User usr :mapOfUser.values()){
                            if(mapToCountOpportunity.containskey(usr.Id) && mapToCountOpportunity.get(usr.Id) <10){
                                Opportunity createnewopp = new Opportunity();
                                createnewopp.OwnerId = usr.Id;
                                createnewopp.Id = newOpportunity.Id;
                                listToUpdate.add(createnewopp);                   
                                Messaging.SingleEmailMessage mailToOwner =new Messaging.SingleEmailMessage();
                                mailToOwner.toaddresses=new List<String>{usr.UserName};
                                    mailToOwner.setSubject('A new Case has been Created');
                                mailToOwner.setPlainTextBody('This is to inform you that a new Case has been created with following details : \n'
                                                             +'Opportunity :'+ newOpportunity.Name + 'OwnerId :'+newOpportunity.OwnerId);
                                
                                Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mailToOwner},false);
                            }
                        } 
                    }
                }
                
            }
            if(!listToUpdate.isEmpty()){
                update listToUpdate;
            }
            
        }catch(Exception x){
            system.debug('Get Error Message' + x.getMessage() + '\nline numberr'+x.getLineNumber());
        }
    }
    public static void updateUserHavinglessOpportunityafterInsert(List<Opportunity> listofopportunity){
        try{
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
            if(!listofopportunity.isEmpty()){
                update listofopportunity;
            }
            
            List<User> listtoupdate = new List<User>();
            listtoupdate.addAll(mapToCount.keyset());
            for(User u : listtoupdate){
                u.Closed_Opportunities__c = mapToCount.get(u);
            }
            if(!listtoupdate.isEmpty()){
                update listtoupdate;  
            }
            
        }catch(Exception x){
            system.debug('Get Error' + x.getMessage() + x.getLineNumber());
        }
    
    } 
}