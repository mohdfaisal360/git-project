trigger checkValidation on Money_Transfer__c (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        MoneyTransfer.checkValidation(trigger.new);
    }
}