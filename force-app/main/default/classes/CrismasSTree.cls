public class CrismasSTree {
     public static void printChristmasTree(integer height) {
        for (integer i = 0; i < height; i++) {
            for (integer j = 0; j < height - i - 1; j++) {
                System.debug(' ');
            }
            for (integer k = 0; k < 2 * i + 1; k++) {
                System.debug('*');
            }
            System.debug('');
        }
        for (integer i = 0; i < height - 1; i++) {
            System.debug(' ');
        }
        System.debug(' ');
    }

    public static void main(String[] args) {
        integer treeHeight = 5; 
        printChristmasTree(treeHeight);
    }
}