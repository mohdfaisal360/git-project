//having a class to create Contact
//Author: Mohd Faisal
public class CreateContacts {
    //Method to create contact with diffrent Account
    public static void contactWithDiffrentAccount(){
        try{
            List<Account> accList = [select Id from Account limit 10 ];
            List<Contact> contactToInsert = new List<Contact>();
            for(integer i = 0; i<10; i++){
                Contact con = new Contact();
                con.FirstName = 'Test';
                con.LastName = 'Contact' + i;
                con.AccountId = accList[i].id;
                system.debug(accList[i].id);
                contactToInsert.add(con);
            }
            if(!contactToInsert.isEmpty()){
                insert contactToInsert;
            }
        }catch(Exception x){
            system.debug('Get Error'+x.getMessage());
        }
    }
}