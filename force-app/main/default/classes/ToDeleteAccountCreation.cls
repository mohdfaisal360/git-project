public class ToDeleteAccountCreation {
    public static void deleteCreatedAccount(){
        String jobName = 'create the account';
        List<CronTrigger> cronTriggers = [SELECT Id, CronJobDetail.Name FROM CronTrigger WHERE CronJobDetail.Name = :jobName];
        
        if (!cronTriggers.isEmpty()) {
            System.abortJob(cronTriggers[0].Id);
            System.debug('Scheduled job deleted: ' + jobName);
        } else {
            System.debug('No scheduled job found with name: ' + jobName);
        }
    }
}