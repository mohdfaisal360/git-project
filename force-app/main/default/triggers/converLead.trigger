trigger converLead on Lead (after insert) {
    if(trigger.isAfter && trigger.isInsert){
       // convertLead.converleadIn(trigger.new);
    }
}