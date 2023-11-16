public class CustomTable {
     @AuraEnabled
    public static void updateAccount( String strRecordId ) {
     
        update new Account(Id = strRecordId,Description = String.valueOf(System.now()));
    }    
}