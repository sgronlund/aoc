import java.util.*;
import java.io.*;

public class Day6part1 {


    public static int checkInput(String check) {
        ArrayList<Character> list = new ArrayList<Character>();
        for(int i = 0; i < check.length(); ++i) {
            if (list.contains(check.charAt(i))) {
                continue;
            } else {
                list.add(check.charAt(i));
            }
        }
        return list.size();
    }

    public static void main(String[] args) throws FileNotFoundException {
        Scanner scan = new Scanner(new File("day6.txt"));
        int totalOcc = 0;
        String test = "";
        while(scan.hasNextLine()) {
            String read = scan.nextLine();
            if (read.length() == 0) {
                totalOcc += checkInput(test);
                test = "";
            } else {
                test = test + read;
            }
        }
        System.out.println("" + totalOcc);
    }
}