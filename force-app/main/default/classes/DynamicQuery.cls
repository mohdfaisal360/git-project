public class DynamicQuery {
    public static void getDynamicSOQL(){
        String z = 'Select Name from Account';
        List<Object> acList = Database.query(z);
        
        string sr = 'Select Id';
        
        String[] strList = new List<String>();
        strList.add('Name');
        strList.add('Phone');
        strList.add('Rating');
        
        string objectName ='Account';
        for(string s:strList){
            sr +=',' +s;
        }
        sr+=' from '+ objectName;
        List<Object> list2 = Database.query(sr);
        system.debug(list2); 
    }
    public static void getFieldVlue(List<Opportunity> listOfOpportunity,Map<Id,Opportunity> oldMap){
        Map<Id,Integer> mapToCountOpportunity = new Map<Id,Integer>();
        set<Id> userId = new set<Id>();
        set<Id> setOfIds = new set<id>();
        for(Opportunity opp :listOfOpportunity){
            if(opp.StageName!=null && opp.StageName!=oldMap.get(opp.Id).StageName){
                setOfIds.add(opp.OwnerId);
            }
        }
        Profile p =[select id,Name from Profile where Name='System Administrator'];
        userId.add(p.Id);
        User usr = [select Id,Closed_Opportunities__c,Open_Opportunities__c, isActive from User where Id IN:userId];
        List<Opportunity> oppList =[select Id,OwnerId,StageName from Opportunity where OwnerId IN:setOfIds AND StageName ='Closed Won'];
        Integer count=oppList.size();
        if(count<10){
            
        }
    }
}