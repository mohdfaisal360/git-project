public class AccountCreation {
    public static void creatingAccount(){
        List<Account> listToInsert = new List<Account>();
        for(integer i=0;i<3;i++){
            Account acc = new Account();
            acc.NAME = 'Schedule Class' + i;
            listToInsert.add(acc);
        }
        if(!listToInsert.isEmpty()){
            insert listToInsert;
        }
    }
}