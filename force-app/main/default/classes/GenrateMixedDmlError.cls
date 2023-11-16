//Class to generate a Mixed Dml 
//Author :Mohd Faisal
public class GenrateMixedDmlError {
    public static void useSetupAndNonSetupObject(){
        Account newacc = new Account();
        newacc.Name = 'new Google Phone';
        insert newacc;
        
        Profile newPro = [select Id,Name from Profile where Name ='System Administrator'];
        User usr = new User();
        usr.Alias = 'abc';
        usr.email='unit.samplequeueitemhandler@email123.com';
        usr.EmailEncodingKey='UTF-8';
        usr.FirstName='SampleQueueItemHandler';
        usr.LastName='Test';
        usr.LanguageLocaleKey='en_US';
        usr.LocaleSidKey='en_GB';
        usr.ProfileId = newPro.Id;
        usr.TimeZoneSidKey='Europe/London';
        usr.username='samplequeueitemhandler@testvs3.com';
        usr.IsActive=true;
        
        insert usr;
    }
}