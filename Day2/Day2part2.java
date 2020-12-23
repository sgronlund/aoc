import java.util.*;
import java.io.*;

public class Day2part2 {
    public static void main(String args[]) throws FileNotFoundException {
        int totalsPasswords = 0;
        Scanner scan = new Scanner(new File("day2.txt"));
        while (scan.hasNextLine()) {
            String temp = scan.nextLine();
            String parts[] = temp.split(" ");
            String limits[] = parts[0].split("-");
            int pos1 = Integer.parseInt(limits[0]) - 1;
            int pos2 = Integer.parseInt(limits[1]) - 1 ;
            char letter = parts[1].charAt(0);
            String pass = parts[2];
            if (pass.charAt(pos1) == letter ^ pass.charAt(pos2) == letter) {
                totalsPasswords++;
            }
        }
        System.out.println("" + totalsPasswords);
    }
}
