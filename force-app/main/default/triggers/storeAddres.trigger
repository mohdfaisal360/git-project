trigger storeAddres on Contact_Address__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        StoreContactAddress.checkAddress(Trigger.new);
    }
}