trigger opportunitytriggerHandler on Opportunity (after insert) {
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            opportunityHandler.myMethod(Trigger.new);
        }
    }
    if(Trigger.isUpdate){
       if(Trigger.isAfter){
              opportunityHandler.myMethod(Trigger.new);
        }
    }
    if(Trigger.isUndelete){
       if(Trigger.isAfter){
              opportunityHandler.myMethod(Trigger.new);
        }
    }
    if(Trigger.isDelete){
       if(Trigger.isAfter){
              opportunityHandler.myMethod(Trigger.old);
        }
    }
    
}