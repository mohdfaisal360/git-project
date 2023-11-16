// Having a class to update opportunity Name
// Author : Mohd Faisal 
public class FetchProducts {
    //method to fetch all products with description having A
    public static void getDescriptionWithA(){
        try{ 
            List<Product2> productList =[select Id,Name,Description from Product2 where Description like '%A%' Limit 10];
            
            if(!productList.isEmpty()){
                 system.debug(productList);
            }
           
        }catch(Exception x){
            system.debug('get message' + x.getMessage());
        }
    }
}