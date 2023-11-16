trigger updateContact on Account (after update) {
    set<id> accid = new  set<id>();
    for(Account acc : trigger.new){
        if(acc.Phone != null && acc.Phone!=Trigger.oldMap.get(acc.Id).Phone){
            accid.add(acc.id);
        }
    }
    List<Account> accList =[select Id,Phone,(select Id,Phone from Contacts) from Account where id IN:accId];
    List<Contact> conList = new List<Contact>();
    for(Account a :accList){
        if(a.Contacts.size()>0){
            for(Contact con:a.Contacts){
                
                con.AccountId = a.Id;
                con.Phone = a.Phone;
                conList.add(con);
            }
        }
    }
    update conList;
}