//Class to show attachment on Contact
// Author : Mohd Faisal
public class ShowAttachmentonContact {
    public static void attachmentOfAccountOnContact(){
        try{
            List<ContentDocumentLink> contenttdocumentlinkToInsert = new List<ContentDocumentLink>();
            List<ContentDocumentLink> listOfContent = [SELECT ContentDocumentId, LinkedEntityID FROM ContentDocumentLink 
                                                       WHERE LinkedEntityID = '0015i00000iGAHXAA4' AND IsDeleted=false];
            
            List<Contact> listOfContact = [select Id from Contact where AccountId = '0015i00000iGAHXAA4'];
            if(listOfContent!=null){
                for(Contact contacts : listOfContact){
                    
                        for(ContentDocumentLink contentDL :listOfContent){
                            ContentDocumentLink CDL = new ContentDocumentLink();
                            CDL.LinkedEntityID = contacts.Id;
                            CDL.ContentDocumentId = contentDL.ContentDocumentId;
                            contenttdocumentlinkToInsert.add(CDL);
                        
                    }
                }
                
            }
            if(!contenttdocumentlinkToInsert.isEmpty()){
                insert contenttdocumentlinkToInsert; 
            }
            
            
        } catch(Exception x){
            system.debug('get Message' +x.getMessage());
        } 
    }
}