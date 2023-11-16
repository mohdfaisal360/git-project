@IsTest
public class Test_Test_Quetion2 {
    @isTest
    public static void TestCreatingAssetForSibling(){
        
        account acc= new account();
        acc.name='My Account';
        acc.Phone='123456789';
        insert acc;
        
        contact cont=new contact();
        cont.lastname='upper account';
        cont.AccountId=acc.id;
        insert cont;
        
        opportunity obj= new opportunity();
        obj.Name='new opp';
        obj.Closedate = Date.today();
        obj.StageName = 'Closed Won';
        obj.AccountId = acc.id;
        insert obj;
        list<asset> newAss = new list<asset>();    
        for (integer i=0;i<2;i++){
            asset assetObj= new asset();
            assetObj.Accountid=acc.id;
            assetObj.name='New Asset ';
            //  assetObj.ContactId=cont.id;
            assetObj.IsCompetitorProduct=true;
            newAss.add(assetobj);
            
        }
        insert newAss;
    }
    
}