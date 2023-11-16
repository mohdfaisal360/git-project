trigger SoldProductTrigger on Opportunity (after update,after delete) {
    if(trigger.isAfter && trigger.isUpdate){
        CountSoldProduct.showProduct(trigger.new,trigger.oldMap);
    }
    
    if(trigger.isAfter && trigger.isDelete){
        CountSoldProduct.deletedOpportunitywithproduct(trigger.old);
    }
}