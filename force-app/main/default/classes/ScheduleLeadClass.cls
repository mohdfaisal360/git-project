public class ScheduleLeadClass Implements Schedulable{
    public void execute(Schedulablecontext bc){
        CreatingBatchFetchingLeadsAsynch newInstance = new CreatingBatchFetchingLeadsAsynch();
        Id batchJobId = Database.executeBatch(newInstance);
    }
}