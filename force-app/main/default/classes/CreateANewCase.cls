// Having a class to create a case and email to the owner with case details
// Author: Mohd Faisal
public class CreateANewCase {
    //Creating Case and Send Email to Owner
    public static void createCaseandSendEmail(List<Case> caseList){
        try{
            List<Task> taskList = new List<Task>();
            List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
            for(Case ca : caseList){
                Messaging.SingleEmailMessage newMail = new Messaging.SingleEmailMessage();
                String subject1  = 'A new case is created ';
                newMail.setSubject(subject1);
                String[] msg = new String[]{'faisalmohd6396@gmail.com'};
                    newMail.setToAddresses(msg);
                String body = 'Case Number' + ca.CaseNumber+ ',<br></br>'+'Description'  +ca.Description+',<br></br>'+'Origin Type'
                    + ca.Origin+',<br></br>' +'Priority>>>>' +ca.Priority+',<br></br>' +ca.Subject ;
                newMail.setHtmlBody(body);
                emailList.add(newMail);
                //Creating a task with AccountId and ContactId 
                Task newTask = new Task();
                newTask.Subject = ca.Subject;
                newTask.Description=ca.Description;
                newTask.Status = 'Not Started';
                newTask.Priority = 'High';
                newTask.WhoId = ca.ContactId;
                newTask.WhatId = ca.AccountId;
                newTask.CaseNumber__c = ca.CaseNumber;
                taskList.add(newTask);
            }
            if(!taskList.isEmpty()){
                insert taskList;
            }
            Messaging.SendEmail(emailList);
        }catch(Exception x){
            system.debug('Get Error Message' + x.getMessage() );
        }
    }
}