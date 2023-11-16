public class test_Question4 {
    public static void createCaseandSendEmail(List<Case> caseList){
        system.debug('caseList>>>'+caseList);
        try{
            set<Id>OwnerIds= new set<Id>();
            list<Task>listOfTask= new list<Task>();
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            if(!caseList.isEmpty()){
                for(Case caseObj:caseList){
                    OwnerIds.add(caseObj.OwnerId);
                }
            }
            
            Map<Id, user> MapOfUser = new Map<Id, user>([SELECT Id, Email FROM user WHERE Id In :OwnerIds LIMIT 2000]);
            if(!caseList.isEmpty()){
                for(Case caObj:caseList){
                    list<string>toAddresses= new list<string>();
                    User relatedCaseUser = MapOfUser.get(caObj.OwnerId);
                    toAddresses.add(relatedcaseUser.Email);
                    string emailSubject='New Case Details'; 
                    string bodyOfEmail='below are the Details of Latest Case'+ caObj.CaseNumber+caObj.Status +caObj.Type+caObj.ContactId+ caObj.Origin;
                    
                    Messaging.SingleEmailMessage mail= new Messaging.SingleEmailMessage();
                    mail.setToAddresses(toAddresses);
                    mail.setSubject(emailSubject);
                    mail.setHtmlBody(bodyOfEmail);
                    
                    mails.add(mail);
                    //create a task and relate it to case's Contacts And Account
                    task taskObj= new task();
                    taskObj.Subject='new task available';
                    taskObj.Description='this task is created when a case is created';
                    taskObj.Status='Not Started';
                    taskObj.Priority='High';
                    taskObj.CaseNumber__c=caObj.CaseNumber;
                    taskObj.WhoId=caObj.ContactId;
                    taskObj.WhatId=caObj.AccountId;
                    listOfTask.add(taskObj);
                }
            }
            if(!listOfTask.isEmpty()){
                insert listOfTask;
            }
            Messaging.sendEmail(mails);
            
        }catch(Exception x){
            system.debug('Get Error Message' + x.getMessage() );
        }
    } 
}