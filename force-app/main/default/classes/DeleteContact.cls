//class to delete contact
//Author : Mohd Faisal
public class DeleteContact {
    //method to delete contact having account name 'A'
    public static void deleteContactHavingAccountName(){
        try{
            List<Contact> contactList = [select AccountId,LastName,Account.Name from Contact where Account.Name Like '%A%'];
            
            if(contactList.isEmpty()){
               Database.Delete(contactList,false); 
            }
            
        }catch(Exception x){
            system.debug('get Message' + x.getMessage());
        }
    }
}