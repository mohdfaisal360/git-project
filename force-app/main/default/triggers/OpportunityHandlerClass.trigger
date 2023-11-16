trigger OpportunityHandlerClass on Opportunity (after insert,after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        ChangeOwnerOfOpportunity.methodToChangeOwner(Trigger.new);
    }
}