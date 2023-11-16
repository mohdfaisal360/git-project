@isTest
public class TestClassforQuetion4 {
    @IsTest
    static void testCreateCaseandSendEmail() {
        Account testAccount = new Account(Name = 'TestAccount');
        insert testAccount;
        
        Contact testContact = new Contact(LastName = 'TestContact',AccountId = testAccount.Id);
        insert testContact;
        
        Case testCase = new Case(
            Subject = 'Test Case',
            Description = 'Test Description',
            Origin = 'Phone',
            Priority = 'High',
            ContactId = testContact.Id,
            AccountId = testAccount.Id
        );
        insert testCase;
        
    }         
    
}