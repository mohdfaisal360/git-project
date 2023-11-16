// Class to create event participant
// Author : Mohd Faisal
public class CreateEventRecord {
    // Method to get diffrent participant
    public static void createRecordWithMultipicklist(){
        try{
            List<Contact> listOfContact = [select Id from Contact Limit 10];
            List<Event__c> listOfEvent = [select Id from Event__c Limit 10];
            
            List<Event_Participant__c> eventParticipanttoInsert = new List<Event_Participant__c>();
            if(listOfContact!=null && listOfContact.size()==10 && listOfEvent!=null && listOfEvent.size()==10){
                for(integer i = 0; i<10;i++){
                    Event_Participant__c newrecord = new Event_Participant__c();
                    newrecord.Name = 'Vansh Madaan';
                    newrecord.Contact__c = listOfContact[i].Id;
                    newrecord.Event__c = listOfEvent[i].Id;
                    if(i>=0 && i<4){
                        newrecord.Madaan__c = 'Attandee Contact';
                    }else if(i>=4 && i<8){
                        newrecord.Madaan__c = 'Persenter Contact';
                    }
                    else{
                        newrecord.Madaan__c = 'Organizer Contact';
                    }    
                    eventParticipanttoInsert.add(newrecord);
                }
            }
            if(!eventParticipanttoInsert.isEmpty()){
                insert eventParticipanttoInsert; 
                
            }  
        }catch(Exception x){
            system.debug('get message' + x.getMessage() + x.getLineNumber());
        }
    }
}