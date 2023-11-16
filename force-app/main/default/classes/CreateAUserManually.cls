//Class  to create a another system admin user
//Author : Mohd Faisal
public class CreateAUserManually {
    //method to create a user  
    public static void CreateAdmin(){
        try{
            Profile getUserProfile = [SELECT id from Profile where Name='System Administrator' limit 1];
            User usr=new User();
            usr.Alias='Alkhan';
            usr.FirstName = 'Khan';
            usr.LastName= 'Ali';
            usr.Email='mohd.faisal@360degreecloud.in';
            usr.Username='mohd.faisal@3606396degreecloud.com';
            usr.ProfileId =getUserProfile.id;
             
            insert usr;
        }catch(Exception c){
            system.debug('get message' + c.getMessage());
        }
    }
}