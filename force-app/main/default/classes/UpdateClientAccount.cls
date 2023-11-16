//Class : to Update Client Account Field on Client
//Author: Mohd Faisal
public class UpdateClientAccount {
    // To Update Custom Account Field of Client using diffrent methods
    public static void toUpdateAccountWith(){
        try{
            List<Client__c> listOfClient = [ SELECT Id,	OrganizationId__c,Email__c,Account__c FROM Client__c LIMIT 10]; // Fetching  data of Client
            
            List<Licence__c> listOfLicenceToCheck = [SELECT Id,Org_Id__c,Account__c FROM Licence__c LIMIT 10]; //Fetching  data of Licence
            Map<String,Licence__c> mapOfLicenceToCheckOrgId = new Map<String,Licence__c>();
            
            for(Licence__c objLic :listOfLicenceToCheck){
                if(!mapOfLicenceToCheckOrgId.containskey(objLic.Org_Id__c)){
                    mapOfLicenceToCheckOrgId.put(objLic.Org_Id__c,objLic); 
                } 
            }
            
            
            List<Contact> listOfContact = [SELECT Id, Email FROM Contact WHERE Email!=Null LIMIT 10 ]; //Fetching data of Contact
            Map<String,Contact> mapOfContactToCheckEmail = new Map<String,Contact>();
            for(Contact objCon:listOfContact){
                if(!mapOfContactToCheckEmail.containskey(objCon.Email) || !mapOfContactToCheckEmail.containskey(objCon.Email.substringafter('@'))){
                    mapOfContactToCheckEmail.put(objCon.Email,objCon);
                    mapOfContactToCheckEmail.put(objCon.Email.substringafter('@'),objCon);
                } 
            }
            
            List<Account> listOfAccount = [SELECT Id, Email_c__c, Website FROM Account WHERE Website!=null AND Email_c__c!=null  LIMIT 10];//Fetching data of Account
            Map<String,Account> mapOfAccount = new Map<String,Account>();
            for(Account objAcc :listOfAccount){
                if(!mapOfAccount.containskey(objAcc.Email_c__c) || !mapOfAccount.containskey(objAcc.Website)){
                    mapOfAccount.put(objAcc.Email_c__c.substringafter('@'),objAcc);
                    mapOfAccount.put(objAcc.Website,objAcc);
                }
            }
            
            
            List<Client__c> listToUpdateClient = new List<Client__c>();//Client list to be update
            
            for(Client__c ObjCli :listOfClient){
                if(mapOfLicenceToCheckOrgId.containskey(ObjCli.OrganizationId__c)){
                    ObjCli.Account__c = mapOfLicenceToCheckOrgId.get(ObjCli.OrganizationId__c).Account__c;
                    listToUpdateClient.add(ObjCli);
                   
                }
                else if(objCli.OrganizationId__c==Null && objCli.Email__c!=null  ){
                    if((mapOfContactToCheckEmail.containskey(objCli.Email__c) || mapOfContactToCheckEmail.containskey(objCli.Email__c.substringafter('@')))){
                        ObjCli.Account__c = mapOfContactToCheckEmail.get(objCli.Email__c).AccountId;
                        ObjCli.Account__c = mapOfContactToCheckEmail.get(objCli.Email__c.substringafter('@')).AccountId;
                        listToUpdateClient.add(ObjCli);
                        
                    }
                }
                else if( objCli.Email__c!=null && mapOfAccount.containskey(objCli.Email__c.substringafter('@'))){
                    ObjCli.Account__c = mapOfAccount.get(objCli.Email__c).Id;
                    listToUpdateClient.add(ObjCli);
                }
            }
           
            if(!listToUpdateClient.isEmpty()){
                update listToUpdateClient;
            }
            
        }catch(Exception ex){
            system.debug('Get Error Message' +ex.getMessage()  +'Get LineNuber'+ ex.getLineNumber());
        }
    }
    
}