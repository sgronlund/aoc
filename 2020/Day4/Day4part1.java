import java.util.*;
import java.io.*;

public class Day4part1{
    public static void main(String args[]) throws FileNotFoundException {
        int validPassport = 0;
        Scanner scan  = new Scanner(new File("day4.txt"));
        String pass = "";
        while(scan.hasNextLine()) {
            String read = scan.nextLine();
            if (read.length() == 0) {
                if (pass.contains("byr") && pass.contains("iyr") && pass.contains("eyr") && pass.contains("hgt") && pass.contains("hcl") && pass.contains("ecl") && pass.contains("pid")) {
                    validPassport++;              
                }
                pass = ""; 
            } else {
                pass = pass.concat(read);
            }
        }
        System.out.println("" + validPassport);
    }
}
