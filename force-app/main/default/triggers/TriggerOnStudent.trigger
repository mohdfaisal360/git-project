trigger TriggerOnStudent on Student__c (after insert,after update,after delete) {
    if(trigger.isAfter && trigger.isInsert){
        Test_Quetion3.countStudentsOfColleges(Trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
        Test_Quetion3.countStudentOfCollegesUpdate(Trigger.new,trigger.oldMap);
    }
     if(trigger.isAfter && trigger.isDelete){
        Test_Quetion3.countStudentsOfCollegesDelete(Trigger.old);
    }
}