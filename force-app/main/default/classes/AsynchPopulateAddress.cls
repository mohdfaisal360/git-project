public class AsynchPopulateAddress {
    public static void populateBillingAddress(List<Account> listOfAccount){
        List<Account> listToUpdate = new List<Account>();
        for(Account acc : listOfAccount){
            if(acc.BillingState == Null && acc.BillingCountry=='USA'){
                acc.BillingState ='California';
                listToUpdate.add(acc);
            }
        }
        if(!listToUpdate.isEmpty()){
            update listToUpdate;
        }
    }
}