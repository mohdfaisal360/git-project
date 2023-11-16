@isTest
public class Test_CreatingCampaign {
    @isTest
    public static void testNewMethod(){
        Account newAcc = new Account();
        newAcc.Name ='Manual Acc';
        newAcc.totalQuantity__c = 0;
        insert newAcc;
        
        
        Campaign newCamp = new Campaign();
        newCamp.Name ='Manual Campaign';
        newCamp.Status='In Progress'; 
        insert newCamp;
        
        Opportunity newOpp = new Opportunity();
        newOpp.Name ='Manual Opp';
        newOpp.Amount=50000;
        newOpp.StageName='Closed Won';
        newOpp.CloseDate=system.today();
        newOpp.AccountId = newAcc.Id;
        newOpp.CampaignId=newCamp.Id;  
        insert newOpp;
        
        
        
        Campaign newCamp1 = new Campaign();
        newCamp1.Id=newCamp.Id;
        newCamp1.Status = 'Completed';
        update newCamp1;
        
        //   Account account = [SELECT Id, totalQuantity__c FROM Account ];
        //   System.assertEquals(100, account.totalQuantity__c, 'Account totalQuantity__c field should be updated correctly');
    }
}