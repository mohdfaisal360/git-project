trigger CreateCampaignTrigger on Campaign (after insert,after update) {
    if(Trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            CreatingCampaign.methodtocount(trigger.new,trigger.oldMap);
        }
        
    } 
}