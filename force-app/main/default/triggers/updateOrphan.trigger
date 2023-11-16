trigger updateOrphan on Contact (before update) {
    if(trigger.isBefore && trigger.isInsert){
        set<Id> accId = new set<Id>();
        for(Contact con : trigger.new){
            if(con.AccountId!=null){
                accId.add(con.AccountId);
            }
        }
        List<Account> listToupdate = new List<Account>();
        List<Contact> conList =[select id,AccountId,LastName from Contact where AccountId IN:accId LIMIT 5];
        for(Contact conObj : conList){
            Account acc = new Account();
            acc.Id = conObj.AccountId;
            acc.Name = conObj.LastName;
            listToupdate.add(acc);
        }
        update listToupdate;
    }
}