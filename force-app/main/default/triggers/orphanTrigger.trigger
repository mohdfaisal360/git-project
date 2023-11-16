trigger orphanTrigger on Contact (after update) {
    if(trigger.isAfter &&  trigger.isUpdate ){
        OrphanContact.getAccount(trigger.new);
    }
}