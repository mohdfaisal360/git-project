public class StoreContactAddress {
    public static void checkAddress(List<Contact_Address__c> listOfcontactAddress){
        try{
            set<Id> CompanyAdd = new set<Id>();
            for(Contact_Address__c con :listOfcontactAddress) {
                if(con.Company_Address__c!=null && con.isActive__c == True){
                    CompanyAdd.add(con.Company_Address__c);
                }
            }
            List<Contact> toUpdate = new List<Contact>();
            
            List<Contact> conList = [select Id,LastName,Total_Active_Address__c,(select Id from Contact_Addresses__r) from Contact where Id IN:CompanyAdd];
            for(Contact co :conList){
                co.Total_Active_Address__c = co.Contact_Addresses__r.size();
                toUpdate.add(co);
            }
            if(!conList.isEmpty()){
                update toUpdate;
            }
          
            
        }catch(Exception ex){
            system.debug('Get Error'+ex.getMessage() +ex.getLineNumber());
        }
    }
}