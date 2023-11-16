public class CotactCreateasNumberInsert {
    public static void createContact(Account acc, List<Contact> newListOfContact){
        List<Contact> contactToInsert = new List<Contact>();
        Decimal numberSize = acc.My_Number__c;
        for(Decimal i=0;i<numberSize;i++){
          Contact con = new Contact();
           con.LastName = acc.Name;
           con.AccountId = acc.Id;
           contactToInsert.add (con); 
        }
        if(contactToInsert!=Null){
           insert contactToInsert; 
        }
    }
}