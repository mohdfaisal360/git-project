// Having class to reverse numbers
// Author : Mohd Faisal
public class ReverseNumber {
    // to reverse any integer  number 
    public static void reverseIntegerNumber(integer n){
        integer reminder=0;
        integer reverse=0;
        while(n > 0){
             reminder = math.mod(n,10);
             reverse = (reverse*10) + reminder;
             n = n / 10;
        
        }
        system.debug('reverse'+ reverse);
    }
}