// Having a class to reverse a Name
// Author Mohd Faisal
public class ReverseName {
    // Method to reverse Name
    public static void reverseCompanyName(){
        try{
            List<Account> accountList = [select Name from Account Limit 10];
            List<String> strReverse = new List<String>();
            String originalName = '';
            String revStr = ' ';   //Blank variable to store reverse 
            for(Account acc :accountList){
                originalName = acc.Name;
                revStr = originalName.reverse();
                strReverse.add(revStr);
            }
            if(!strReverse.isEmpty()){
                system.debug(strReverse);
            }
            
        }catch(Exception x){
            system.debug('To Show Message' + x.getMessage());
        }
    }
}