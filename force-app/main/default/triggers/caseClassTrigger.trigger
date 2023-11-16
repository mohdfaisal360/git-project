trigger caseClassTrigger on Case (after insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            countOpenCases.coutOpenandCloseCaseOnContact(Trigger.new);
        }
    }
}