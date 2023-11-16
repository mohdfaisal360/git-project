public class countOpenCases {
    public static void coutOpenandCloseCaseOnContact(List<Case> listOfCase){
        Map<Id,List<Case>> mapOfOpenCase = new Map<Id,List<Case>>();
        Map<Id,List<Case>> mapOfCloseCase = new Map<Id,List<Case>>();
        for(Case caseObj:listOfCase){
            if(caseObj.ContactId!=Null && caseObj.Status=='New'){
                if(!mapOfOpenCase.containskey(caseObj.ContactId)){
                    mapOfOpenCase.put(caseObj.ContactId,new List<Case>());
                }
                mapOfOpenCase.get(caseObj.ContactId).add(caseObj); 
            }
            else if(caseObj.ContactId!=Null && caseObj.Status=='Closed'){
                if(!mapOfCloseCase.containskey(caseObj.ContactId)){
                    mapOfCloseCase.put(caseObj.ContactId,new List<Case>());
                }
                mapOfCloseCase.get(caseObj.ContactId).add(caseObj);
            }             
        }
        System.debug('mapOfOpenCase>>>>'+mapOfOpenCase);
        System.debug('mapOfCloseCase>>>>'+mapOfCloseCase);
        
        Map<Id,Contact> mapOfContactToUpdate = new Map<Id,Contact>();
        if(mapOfOpenCase.keyset()!=Null){
            for(Id openIdsContact :mapOfOpenCase.keyset()){
                if(!mapOfContactToUpdate.containskey(openIdsContact)){
                    Contact newConObj=new Contact();
                    newConObj.Id=openIdsContact;
                    newConObj.No_Of_Open_Cases__c=mapOfOpenCase.get(openIdsContact).size();
                    
                    mapOfContactToUpdate.put(openIdsContact,newConObj);
                }
                else{
                    mapOfContactToUpdate.get(openIdsContact).No_Of_Open_Cases__c=mapOfOpenCase.get(openIdsContact).size();
                }
            }  
        }
        if(mapOfCloseCase.keyset()!=Null){
            for(Id closeIdsContact :mapOfCloseCase.keyset()){
                if(!mapOfContactToUpdate.containskey(closeIdsContact)){
                    Contact newConObj=new Contact();
                    newConObj.Id=closeIdsContact;
                    newConObj.No_Of_Closed_Cases__c=mapOfCloseCase.get(closeIdsContact).size();
                    
                    mapOfContactToUpdate.put(closeIdsContact,newConObj);
                }
                else{
                    mapOfContactToUpdate.get(closeIdsContact).No_Of_Closed_Cases__c=mapOfCloseCase.get(closeIdsContact).size();
                }
            } 
        }
        System.debug('mapOfContactToUpdate>>>>'+mapOfContactToUpdate);
        if(!mapOfContactToUpdate.values().isEmpty()){
            update mapOfContactToUpdate.values();
        }
        
    }
}