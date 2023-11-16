//Class to clone opportunity
//Author : Mohd Faisal
public class CloneOpportunity {
    //clone opportunity with opportunity line item
    public static void cloneOpportunityWithOpportunityLineItem(){
        try{
            List<Opportunity> listOfOpportunity = [Select FIELDS(STANDARD),
                                                   (SELECT FIELDS(STANDARD) FROM OpportunityLineItems)
                                                   from Opportunity LIMIT 1];
            system.debug('Show Details' + listOfOpportunity[0].Name);
            List<Opportunity> listToInsert = new List<Opportunity>();
            
            if(listOfOpportunity!=null && !listOfOpportunity.isEmpty()){            
                Opportunity opportunityClone=listOfOpportunity[0].clone(false,true,false,false);
                opportunityClone.CloseDate=listOfOpportunity[0].CloseDate+30;
                opportunityClone.Name=listOfOpportunity[0].Name+'-Clone';
                listToInsert.add(opportunityClone);
                System.debug(listToInsert);
                if(!listToInsert.isEmpty()){
                    insert listToInsert;
                }
                System.debug(opportunityClone.Id);
                
                List<OpportunityLineItem> oportunityLICloneList=new List<OpportunityLineItem>();
                for(Opportunity opp: listOfOpportunity){
                    for(OpportunityLineItem opLI:opp.opportunityLineItems){
                        OpportunityLineItem opportunityLIClone=opLI.clone(false,true,false,false);
                        opportunityLIClone.OpportunityId=opportunityClone.Id;
                        opportunityLIClone.TotalPrice=null;
                        System.debug(opportunityLIClone);
                        oportunityLICloneList.add(opportunityLIClone);
                    }
                }
                if(!oportunityLICloneList.isEmpty()){
                    insert oportunityLICloneList;
                }
            }
        }
        catch(Exception x){
            system.debug('Get Error Message'+ x.getMessage() + x.getLineNumber());
        }
        
    }
    
}