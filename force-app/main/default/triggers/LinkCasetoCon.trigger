trigger LinkCasetoCon on Case (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        LinkCaseToContact.caseToContact(trigger.new,trigger.oldMap);
    }
}