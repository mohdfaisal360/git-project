public class CustomObjectRecord {
    @AuraEnabled(Cacheable=True)
    public static 	Event__c getRecord(Id recordId){
        return [SELECT Id FROM 	Event__c WHERE Id = :recordId];
    }
}