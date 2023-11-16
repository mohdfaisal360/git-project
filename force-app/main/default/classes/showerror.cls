public class showerror {
    public static void deuplicateAcc(List<Account> accList){
        set<String> accId = new set<String>();
        set<string> existId = new set<string>();
        for(Account acc : accList){
           accId.add(acc.Name); 
        }
        List<Account> accountList = [select Id,Name from Account where Name IN: accId];
        for(Account newacc :accountList){
            existId.add(newacc.Name);
        }
        for(Account acc : accList){
            if(existId.contains(acc.Name)){
                acc.addError('duplicate Name');
            }
        }
    }
}