trigger AccountHandlerClass on Account (before insert) {
    if(trigger.isAfter && trigger.isUpdate){
        AccountHandler.handlerClass(Trigger.new,trigger.oldMap);
    }
   
}