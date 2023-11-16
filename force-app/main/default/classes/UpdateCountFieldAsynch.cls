public class UpdateCountFieldAsynch 
{
    public static void updateAccountField()
    {
        List<Account> listOfAccount=[select Id,Count__c,(select Id from Contacts) from Account];
        for(Account acc:listOfAccount)
        {
            if(acc.Contacts!=Null && acc.Contacts.size()>0)
            {
                acc.Count__c = acc.Contacts.size();
            }
        }
        if(!listOfAccount.isEmpty())
        {
            update listOfAccount;
        }
    }
}