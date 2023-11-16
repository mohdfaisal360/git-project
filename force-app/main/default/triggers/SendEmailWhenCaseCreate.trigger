trigger SendEmailWhenCaseCreate on Case (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        test_Question4.createCaseandSendEmail(trigger.new);
    }
}