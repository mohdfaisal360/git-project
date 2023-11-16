//Class to create multiple  Account
//Author: Mohd Faisal
public class CreateTwentyAccount {
    // method to insert  twenty account with the value of five filed 
    public static void accountWithFiveFieldFilled(){
        List<Account> accToInsert = new List<Account>();
        
        try{
            for(integer i = 0; i<20; i++){
                Account acc = new Account();
                acc.Name = 'Test Account' + i;
                acc.Type = 'Customer';
                acc.Industry = 'Banking';
                acc.Ownership = 'Public';
                acc.Rating = 'Hot';
                accToInsert.add(acc);
            }
            if(!accToInsert.isEmpty()){
                insert accToInsert; 
            }
            
            List<Account> accountInAsc = [select Id,Name from Account ORDER BY Name ASC LIMIT 20];
            for(Account aa : accountInAsc) {
                system.debug('Accounts Name'+ aa);
            }         
        } catch(Exception x){
            system.debug('Error Message' + x.getMessage());
        }    
    }    
}