public class ScheduleSimpleClass Implements Schedulable{
    public void execute(Schedulablecontext bc){
        String jobName = 'InsertAccountsJob';
        String cronExp = '0 0 12 * * ?'; // Run at 12 PM every day
        System.schedule(jobName, cronExp, new ScheduleSimpleClass());
        
    }
}