//  class to display user details
// Author : Mohd Faisal
public class DisplayUserdetails {
    //method to display current user details
    public static void userWithNameNumberEmail(){
        try{
            User currentUser = [select Id,Name,Email from User where Id  =: UserInfo.getUserId()];
            system.debug(currentUser);
        }catch(Exception x){
            system.debug('get message' + x.getMessage());
        }
        
    }
}