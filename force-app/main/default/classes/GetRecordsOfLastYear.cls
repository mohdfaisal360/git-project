//Class to having records of last year
//Author : Mohd Faisal
public class GetRecordsOfLastYear {
    // to fetch records based on piclist value
    public static void recordsofTenantandSeller(){
        try{
            List<Lead> records = [select Id,Records__c from Lead where  Records__c INCLUDES ('Seller','Tenant') AND CreatedDate = Last_Year ];
            system.debug('get records' + records);
        }catch(Exception e){
            system.debug(e.getMessage()   + e.getLineNumber());
        }
    }
}