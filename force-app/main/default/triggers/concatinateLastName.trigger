trigger concatinateLastName on Contact (after insert,after update,after delete,after undelete) {
    if(trigger.isAfter && trigger.isInsert){
        ConcatinateName.addLastNameInAccountName(trigger.new);
    }
     if(trigger.isAfter && trigger.isUpdate){
        ConcatinateName.updateAccNamewithLastName(trigger.new,trigger.oldMap,trigger.newMap);
    }
     if(trigger.isAfter && trigger.isDelete){
        ConcatinateName.concatConLastNameOnDelete(trigger.old,trigger.oldMap);
    }
     if(trigger.isAfter && trigger.isUndelete){
        ConcatinateName.concatConLastNameOnUndelete(trigger.new);
    }
}