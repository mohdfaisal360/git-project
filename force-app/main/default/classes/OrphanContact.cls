public class OrphanContact {
    static Boolean checkRecursive=true;
    public static void getAccount(List<Contact> lisOfContact) {
        try{
            if(checkRecursive){
                Map<String, Id> domainToAccountIdMap = new Map<String, Id>(); 
                for(Contact conObj :lisOfContact){
                    if(conObj.AccountId!=Null && conObj.Email!=Null){
                        String domain = conObj.Email.substringBetween('@','.');
                        domainToAccountIdMap.put(domain,conObj.AccountId);
                    }
                }
                system.debug('domainToAccountIdMap>>>>'+domainToAccountIdMap);
                
                List<Contact> orphanContacts = [SELECT Id, Email,AccountId FROM Contact WHERE AccountId = null AND Email != null];
                system.debug('orphanContacts>>>'+orphanContacts);
                for (Contact orphan : orphanContacts) {
                    String orphandomain = orphan.Email.substringBetween('@','.');
                    if(domainToAccountIdMap.containskey(orphandomain)){
                        orphan.AccountId = domainToAccountIdMap.get(orphandomain);
                    }   
                }
                system.debug('orphanContacts>>>'+orphanContacts);
                if(!orphanContacts.isEmpty()){
                    checkRecursive=false;
                    update orphanContacts;
                } 
            }
        }catch(Exception ex){
            system.debug('get message'+ex.getMessage());
        }
    }
}