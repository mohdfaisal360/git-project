public class deleteMultipleRecordcCass {
    
    public List<Account> getIDs;
    
    public String accIds{get;set;}    
    public deleteMultipleRecordcCass(ApexPages.StandardSetController controller){
        System.debug('Get Selected');
        getIDs = controller.getSelected();
        list<id> accIds = new list<id>();
        for(Account acc : getIDs){
           
            accIds.add(acc.id);
            System.debug(acc.id);
        }   
    } 
    
     public PageReference checkForDelete() {
         
         delete getIDs;

        return null;
    }
    
}