@isTest
public class Test_ClassOnStudent {
    @isTest
    public static void countStudent(){
        List<College__c> colleges = new List<College__c>();
        College__c college1 = new College__c();
        college1.Name = 'College 1';
        String var1;
        college1.TotalDayScholarStudents__c = var1;
        String var2;
        college1.TotalHostelerStudents__c = var2;
        colleges.add(college1);

        College__c college2 = new College__c();
        college2.Name = 'College 2';
        String var3;
        college2.TotalDayScholarStudents__c = var3;
        String var4;
        college2.TotalHostelerStudents__c = var4;
        colleges.add(college2);

        insert colleges;

        List<Student__c> students = new List<Student__c>();
        Student__c student1 = new Student__c();
        student1.Name = 'Student 1';
        student1.College__c = college1.Id;
        student1.Type__c = 'Hostler';
        students.add(student1);

        Student__c student2 = new Student__c();
        student2.Name = 'Student 2';
        student2.College__c = college1.Id;
        student2.Type__c = 'Day Scholar';
        students.add(student2);

        Student__c student3 = new Student__c();
        student3.Name = 'Student 3';
        student3.College__c = college2.Id;
        student3.Type__c = 'Hostler';
        students.add(student3);

        Test.startTest();
        Test_Quetion3.countStudentsOfColleges(students);
        Test.stopTest();
    }
}