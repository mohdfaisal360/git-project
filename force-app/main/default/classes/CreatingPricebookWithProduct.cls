//class to create price book
//Author:Mohd Faisal
public class CreatingPricebookWithProduct {
    public static void createPriceBook(){
        try{
            //creating price book
            Pricebook2 book = new Pricebook2();
            book.Name = 'Algo Pricebook';
            book.IsActive = True;
            insert book;
            
            // for product
            List<Product2> listOfProduct = new List<Product2>();
            for(integer i=1;i<=10;i++){
                Product2 pro = new Product2();
                pro.Name = 'Book' + i;
                pro.Family = 'Books';
                pro.IsActive = True;
                listOfProduct.add(pro);
            }
            if(!listOfProduct.isEmpty()){
                insert listOfProduct;
            }
            
            //for standard pricebook
            Pricebook2 stanPB = [select Id from Pricebook2 where IsStandard = True];
            List<PricebookEntry> pricebookentryToInsert = new List<PricebookEntry>();
            for(Product2 newProduct1:listOfProduct){
                PricebookEntry standardPricebookEntry = new PricebookEntry();
                standardPricebookEntry.Pricebook2Id = stanPB.Id;
                standardPricebookEntry.Product2Id = newProduct1.Id;
                standardPricebookEntry.UnitPrice = 5000;
                pricebookentryToInsert.add(standardPricebookEntry);   
            }
            if(!pricebookentryToInsert.isEmpty()){
                insert pricebookentryToInsert;
            }
            //for custom book pricebookentry
            List<PricebookEntry> pricebookEntryList1 = new List<PricebookEntry>();
            for(Product2 newProduct2 : listOfProduct){
                PricebookEntry customPriceBookEntry = new PricebookEntry();
                customPriceBookEntry.Product2Id = newProduct2.Id;
                customPriceBookEntry.Pricebook2Id = book.Id;
                customPriceBookEntry.UnitPrice = 2000;
                customPriceBookEntry.IsActive = True;
                pricebookEntryList1.add(customPriceBookEntry);
            }  
            if( pricebookEntryList1.isEmpty()){
                insert pricebookEntryList1;
            }
        }catch(Exception x){
            system.debug('get Message' + x.getMessage());
        }
    }    
}