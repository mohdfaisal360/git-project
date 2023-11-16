public class HandleMixedDml Implements Queueable{
    public  void execute(QueueableContext bc){
        GenrateMixedDmlError.useSetupAndNonSetupObject(); 
    }     
}