// Having a class to create product
// Author : Mohd Faisal
public class CreateProduct {
    //method to create product with diffrent name
    public static void productWithDiffrentName(){
        try{ 
            List<Product2> productToInsert = new List<Product2>();
            for(Integer i=1;i<=10;i++){
                Product2 newpro = new Product2();
                newpro.Name ='New Product' + i;
                newpro.Description = 'This is my new product'+ i;
                newpro.Family = 'Electronics';
                productToInsert.add(newpro);
            }
            if(!productToInsert.isEmpty()){
                insert productToInsert;
            }
            
           }catch(Exception x){
               system.debug('get message' + x.getMessage());
           }
    }
}