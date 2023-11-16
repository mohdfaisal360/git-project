trigger newprospectConvert on Prospect__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
       // convertLead.converleadIn(Trigger.new);
    }
}