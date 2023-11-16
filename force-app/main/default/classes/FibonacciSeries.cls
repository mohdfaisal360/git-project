// Creating a class to print fionacci series
// Author  Mohd Faisal
public class FibonacciSeries {
    // Method to print finocci Series 
    public static void printFinocci(integer n){
        try{
            Integer num1 =0, num2= 1, num3=0,i;
            List<Integer> newList = new List<Integer>();
            for(i=0;i<n;i++){
                num3 = num1 + num2;
                newList.add(num1);
                num1 = num2;
                num2 = num3;
            }
            system.debug('newList'+ newList);
        }catch(Exception e){
            system.debug('Error Message' + e.getMessage());
            
        }
    }
    
}