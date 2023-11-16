public class FetchingLeadsAsynch {
    public static void getLeadsNohavePhoneNumber(List<Lead> listOfLead){
        for(Lead le :listOfLead){
            List<User> userlist = [select Id,Name,Email,Profile.Name from User where Profile.Name='System Administrator'];
            Messaging.SingleEmailMessage mailToCaseOwner =new Messaging.SingleEmailMessage();
            mailToCaseOwner.toaddresses= new List<String>{userlist[0].Email};
                mailToCaseOwner.setSubject('A new Case has been Created');
            mailToCaseOwner.setPlainTextBody('This is to inform you that created of this lead is yesterday : \n'
                                             +'LeadName :' + le.Name
                                             +'Phone :'+le.Phone  +'CreatedDate :'+le.CreatedDate);
            
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{mailToCaseOwner},false);
            
        }
    }
}