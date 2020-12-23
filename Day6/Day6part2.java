import java.util.*;
import java.io.*;

public class Day6part2 {


    public static int checkMultiple(ArrayList<String> inputs) { // {a, a, a, a}
        return 0;
    }


    public static void main(String[] args) throws FileNotFoundException {
        Scanner scan = new Scanner(new File("day6.txt"));
        ArrayList<String> list = new ArrayList<String>(); 
        int totalOcc = 0;
        while(scan.hasNextLine()) {
            String read = scan.nextLine();
            if (read.length() == 0) {
                System.out.println(list.toString() + " " + checkMultiple(list));
                totalOcc += checkMultiple(list);
                list.clear();
            } else {
                list.add(read);
            }
        }
        System.out.println("" + totalOcc);
    }
}