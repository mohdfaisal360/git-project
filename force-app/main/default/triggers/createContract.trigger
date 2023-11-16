trigger createContract on Contract_Owerview__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        CreateContractOverview.contractCreate(trigger.new);
    }
}