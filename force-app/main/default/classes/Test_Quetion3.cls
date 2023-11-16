public class Test_Quetion3 {
    public static void countStudentsOfColleges(List<Student__c> listOfStudent){
        try{
            Set<Id> CollgIds = new Set<Id>();
            for(Student__c studObj:listOfStudent){
                if(studObj.College__c!=Null){
                    CollgIds.add(studObj.College__c);
                }
            }
            
            if(!CollgIds.isEmpty()){
                Map<Id,College__c> listToUpdate = new Map<Id,College__c>([SELECT Id,TotalDayScholarStudents__c,TotalHostelerStudents__c 
                                                                          FROM College__c WHERE Id IN: CollgIds]);
                for(Student__c studObj:listOfStudent){
                    if(listToUpdate.containskey(studObj.College__c) && studObj.Type__c=='Hostler'){
                        listToUpdate.get(studObj.College__c).TotalHostelerStudents__c+=1;
                    }
                    else if(listToUpdate.containskey(studObj.College__c) && studObj.Type__c=='Day Scholar'){
                        listToUpdate.get(studObj.College__c).TotalDayScholarStudents__c+=1;
                    }
                }
                
                if(!listToUpdate.values().isEmpty()){
                    update listToUpdate.values();
                }
            }
        }
        catch(Exception Ex){
            System.debug('Exception Message->> ' + Ex.getMessage() + 'Get Line Number->> ' + Ex.getLineNumber());
        }
        
    }
    /////////For Update    >>>>>>>>>>
    public static void countStudentOfCollegesUpdate(List<Student__c> listOfStudent, Map<Id,Student__c> oldMap){
        try{
            Set<Id> CollgIds=new Set<Id>();
            for(Student__c studObj:listOfStudent){
                if(studObj.Type__c!=oldMap.get(studObj.Id).Type__c || studObj.College__c!=oldMap.get(studObj.Id).College__c){
                    if(studObj.College__c==null && oldMap.get(studObj.Id).College__c!=Null){
                        CollgIds.add(oldMap.get(studObj.Id).College__c);
                    }
                    else if(studObj.College__c!=null  && oldMap.get(studObj.Id).College__c!=null){
                        CollgIds.add(studObj.College__c);
                        CollgIds.add(oldMap.get(studObj.Id).College__c);
                    }
                    else if(studObj.College__c!=null  && oldMap.get(studObj.Id).College__c==null){
                        CollgIds.add(studObj.College__c);
                    }
                }
            }
            
            System.debug(CollgIds);
            Map<Id, College__c> mapToUpdate =new Map<Id, College__c>();
            
            for(AggregateResult agr1:[SELECT College__c collgId,Type__c type ,Count(Id)
                                      stud FROM Student__c WHERE College__c IN :CollgIds 
                                      GROUP BY College__c, Type__c ]){
                                          System.debug(agr1);
                                          if(!mapToUpdate.containskey((ID)agr1.get('collgId')) && agr1.get('type')=='Hostler'){
                                              mapToUpdate.put((ID)agr1.get('collgId'), new College__c(Id=(ID)agr1.get('collgId'), 
                                                                                                      TotalHostelerStudents__c=(String)agr1.get('stud')));
                                              System.debug(mapToUpdate);
                                          }
                                          else if(!mapToUpdate.containskey((ID)agr1.get('collgId')) && agr1.get('type')=='Day Scholar'){
                                              mapToUpdate.put((ID)agr1.get('collgId'), new College__c(Id=(ID)agr1.get('collgId'), 
                                                                                                      TotalDayScholarStudents__c=(String)agr1.get('stud')));
                                              System.debug(mapToUpdate);
                                          }
                                      }
            
            System.debug(mapToUpdate.values());
            
            if(!mapToUpdate.values().isEmpty()){
                update mapToUpdate.values();
            }
        }
        catch(Exception Ex){
            System.debug('Exception Message->> ' + Ex.getMessage() + 'Get Line Number->> ' + Ex.getLineNumber());
        }  
    }
    
    /////// for delete >>>>>
    public static void countStudentsOfCollegesDelete(List<Student__c> listOfStudent){
        try{
            Set<Id> CollgIds = new Set<Id>();
            for(Student__c studObj : listOfStudent){
                if(studObj.College__c!=Null){
                    CollgIds.add(studObj.College__c);
                }
            }
            System.debug(CollgIds);
            Map<Id, College__c> mapToUpdate = new Map<Id, College__c>();
            
            for(AggregateResult agr :[SELECT College__c collgId,Type__c type ,Count(Id)
                                      stud FROM Student__c  WHERE College__c IN :CollgIds 
                                      GROUP BY College__c, Type__c ]){
                                          if(!mapToUpdate.containskey((ID)agr.get('collgId')) && agr.get('type')=='Hostler'){
                                              mapToUpdate.put((ID)agr.get('collgId'), new College__c(Id=(ID)agr.get('collgId'), 
                                                                                                      TotalHostelerStudents__c=(String)agr.get('stud')));
                                              System.debug(mapToUpdate);
                                          }
                                          else if(!mapToUpdate.containskey((ID)agr.get('collgId')) && agr.get('type')=='Day Scholar'){
                                              mapToUpdate.put((ID)agr.get('collgId'), new College__c(Id=(ID)agr.get('collgId'), 
                                                                                                      TotalDayScholarStudents__c=(String)agr.get('stud')));
                                              System.debug(mapToUpdate);
                                          }
                                      }
            
            System.debug(mapToUpdate.values());
            if(!mapToUpdate.values().isEmpty()){
                update mapToUpdate.values();
            }
        }
        catch(Exception Ex){
            System.debug('Exception Message->> ' + Ex.getMessage() + 'Get Line Number->> ' + Ex.getLineNumber());
        }
        
    }
    
}