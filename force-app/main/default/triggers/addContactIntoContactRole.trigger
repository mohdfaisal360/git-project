trigger addContactIntoContactRole on Opportunity (after insert,after update,after delete,after undelete) {
    if(trigger.isAfter && trigger.isInsert){
        AddContactIntoContactRole.addRelatedContactToOpportunityContactRole(Trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
        AddContactIntoContactRole.updateContactOnContactRole(Trigger.new,Trigger.oldMap);
    }
     if(trigger.isAfter && trigger.isDelete){
        AddContactIntoContactRole.addRelatedContactToOpportunityContactRole(Trigger.old);
    }
     if(trigger.isAfter && trigger.isUndelete){
        AddContactIntoContactRole.addRelatedContactToOpportunityContactRole(Trigger.new);
    }
}