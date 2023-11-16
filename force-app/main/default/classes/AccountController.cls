public with sharing class AccountController {

    @AuraEnabled
    public static void updateAccountName(String strRecordId) {
        try {
            
           update new Account(Id = strRecordId,Description = String.valueOf(System.now()));
        } catch (Exception e) {
            throw new AuraHandledException('Error updating the Account: ' + e.getMessage());
        }
    }
}