trigger updateopp on Top_X_Designation__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        TopXDesigantion.updateOpportunity(trigger.new);
    }
}