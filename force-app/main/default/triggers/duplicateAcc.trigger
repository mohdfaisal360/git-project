trigger duplicateAcc on Account (before insert,before update) {
    /*if(trigger.isBefore && trigger.isInsert){
        showerror.deuplicateAcc(trigger.new);
    }*/
     if(trigger.isBefore && trigger.isUpdate){
       TotalAmount.getAmount(trigger.new);
    }
}