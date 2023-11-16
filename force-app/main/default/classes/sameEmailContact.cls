//having class to check  email
//Author : Mohd Faisal
public class sameEmailContact {
    // to check same email 
    public static void contactEmail(){
        list<String> strEmail = new List<String>();
        List<User> emailUser =[select id,Email from User];
        for(User usr : emailUser){
            strEmail.add(usr.Email);
        }
        List<Contact> contacts =[select Id,Email, FirstName, LastName from Contact where Email IN:strEmail];
        List<Contact> existContact = new List<Contact>();
        for(Contact con :contacts){
            if(strEmail.contains(con.Email)){
                existContact.add(con);
                system.debug('Email of Exist Contact'+ existContact);
            }
        }
        
    }
}