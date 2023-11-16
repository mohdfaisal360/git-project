//class having to implement Round Robbin
//Author: Mohd Faisal
public class AssigningContactInRoundRobinManner {
    //method to assign case to user using round robbin
    public static void assigningUserContact(List<Contact> listofContact){
        try{
            
            List<Contact> lastInsertedContact = [SELECT Id, Round_Robin_Id__c FROM Contact WHERE Round_Robin_Id__c!=NULL ORDER BY CreatedDate DESC LIMIT 1];
            
            List<User> listOfUser = [SELECT Id FROM User WHERE Profile.Name='System Administrator' AND IsActive = true];
            system.debug('userlist.....'+listOfUser);
            Integer currentIndex = (Integer)lastInsertedContact[0].Round_Robin_Id__c;
            
            for (Contact newContact : listofContact) {
                
                User assignedUser = listOfUser[currentIndex];
                
                newContact.OwnerId = assignedUser.Id;
                currentIndex = math.mod(currentIndex + 1, listOfUser.size());
               
                newContact.Round_Robin_Id__c=currentIndex;
                
            }    
        }catch(Exception ex){
            system.debug('get message'+ex.getMessage());
        }
    }
}