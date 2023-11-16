trigger checkTrigger on Account (before insert) {
    if(trigger.isBefore && trigger.isAfter){
       // CheckTrigger.checkEvent(Trigger.new);
    }
}