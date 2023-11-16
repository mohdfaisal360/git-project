trigger CampaignTrigger on Campaign (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        CampaignHandlerClass.updateOpportunityStage(trigger.new,trigger.oldMap);
    }
}