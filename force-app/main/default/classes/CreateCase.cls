//Class to create  5 case record
//Author : Mohd Faisal 
public class CreateCase {
    //Method to create case with account and contac
    public static void caseWithAccountandContact(){
        try{
            List<Account> accountList = [select Id,Name from Account limit 5];
            List<Contact> contactList = [select Id,LastName from Contact limit 5];
            List<Case> caseListToInsert = new List<Case>();
            for(integer i=0; i<5;i++){
                Case ca = new Case();
                ca.AccountId = accountList[i].Id;
                ca.ContactId = contactList[i].Id;
                ca.Status = 'New';
                ca.Origin = 'Phone';
                caseListToInsert.add(ca);
            }
            if(!caseListToInsert.isEmpty()){
                insert caseListToInsert;
            }
        }catch(Exception c){
            system.debug('get message' + c.getMessage());
        }
    }
    
}