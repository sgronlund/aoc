import java.util.*;
import java.io.*;

public class Day2part1 {
    public static void main(String args[]) throws FileNotFoundException {
        int totalsPasswords = 0;
        Scanner scan = new Scanner(new File("day2.txt"));
        while (scan.hasNextLine()) {
            int occurences = 0;
            String temp = scan.nextLine();
            String parts[] = temp.split(" ");
            String limits[] = parts[0].split("-");
            int min = Integer.parseInt(limits[0]);
            int max = Integer.parseInt(limits[1]);
            char letter = parts[1].charAt(0);
            String pass = parts[2];
            for (int i = 0, n = pass.length(); i < n; i++) {
                if (n < min) {
                    break;
                } 
                if (pass.charAt(i) == letter) {
                    occurences++;
                }
            }
            if (occurences >= min && occurences <= max) {
                totalsPasswords++;
            }
        }
        System.out.println("" + totalsPasswords);
    }
}