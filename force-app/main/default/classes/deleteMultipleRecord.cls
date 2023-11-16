public class deleteMultipleRecord {
    @AuraEnabled(cacheable = true)
    public static List<Account> displayAccounts() {
        return [ SELECT Id, Name FROM Account];    
    }
    @AuraEnabled
    public static List<Account> delAccount(List<Account> accList) {
        List<Account> delList = new List<Account>();
        for(Account acc:[select id from Account where id IN:accList]){
            delList.add(acc);
        }
        if(delList.size()>0){
            try{
                delete delList;
            }
            catch(Exception e){
                new AuraHandledException('unable to delete' +e.getMessage());
            }
        }
        return accList;
    }
   
}