trigger getOpportunityContactrole on Opportunity (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        fetchTotalQuantityfromOLI.totalOppofromOPL(Trigger.new);
    }
}