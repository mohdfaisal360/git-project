//Creating a class to print Message
// Author: "Mohd Faisal" 
public class DisplayMessage {
    // Method to display a Welcome Message
    public static void welcomeMessage(){
        try{
            String welcomeMessage = 'Welcome To Salesforce';
            system.debug('welcomeMessage'+ welcomeMessage);
        }catch(Exception e){
            system.debug('Show Message' + e.getMessage());
        }
    }
}