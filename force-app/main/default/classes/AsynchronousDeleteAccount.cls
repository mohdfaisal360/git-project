//Class to delete account created 10 days before
//Author : Mohd Faisal
public class AsynchronousDeleteAccount {
    public static void deleteAccountCreated(List<Account> listOfAccount){
       Database.delete(listOfAccount,false);
    }
}