public class RefrenceController {
    @AuraEnabled
    public static List<Account> getAccountRating(Id accountId){
        return [select Id, Rating from Account where Id=:accountId];
    }
}