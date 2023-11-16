// Class to create event based on  those contacts for perticular Accounts.
// Owner: Mohd Faisal
public class FindContactandCreateEvent {
    // create event based on those contacts  whose account having field employess greater than 500 and less than 1000;
    public static void checkContact(){
        List<Event> listToInsert = new List<Event>();
        List<Contact> listOfContacts = [select Id,AccountId from Contact where Account.Employees__c>500 AND Account.Employees__c<1000];
        for(Contact con : listOfContacts){
            Event evobj = new Event();
            evobj.WhoId = con.Id;
            evobj.Description = 'This Event is created automatically every month';
            evobj.Subject = 'Regarding Contact Creation';
            evobj.StartDateTime =system.now();
            evobj.EndDateTime = system.now();
            listToInsert.add(evobj);
        }
        if(!listToInsert.isEmpty()){
            insert listToInsert;
        }
    }
}