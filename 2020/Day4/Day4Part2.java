import java.util.*;
import java.io.*;

public class Day4Part2{

    public static boolean checkPID(String value) {
        if (value.length() == 9) {
            for(int i = 0; i < value.length(); ++i) {
                int ascii = (int) value.charAt(i);
                if (ascii >= 48 || ascii <= 57) {
                    continue;
                } else {
                    return false;
                }
            }
            return true;
        } else {
            return false;
        }
    }

    public static boolean checkECL(String value) {
        return (value.equals("amb") ^ value.equals("blu") ^ value.equals("brn") ^ value.equals("gry") ^ value.equals("grn") ^ value.equals("hzl") ^ value.equals("oth"));
    }

    public static boolean checkHCL(String value) {
        if (value.charAt(0) == '#') {
            String colval = value.substring(1, value.length());
            if (colval.length() == 6) {
                for (int i = 0; i < colval.length(); ++i) {
                    int ascii = (int) colval.charAt(i);
                    if((97 <= ascii && ascii <= 103) || (48 <= ascii && ascii <= 57)) {
                        continue;
                    } else {
                        return false;
                    }
                }
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public static boolean checkHGT(String value) {
        int height;
        if (value.endsWith("in")) {
            int strlen = value.length();
            height = Integer.parseInt(value.substring(0, strlen-2));
            return (height <= 76 && height >= 59); 
        } else if (value.endsWith("cm")) {
            int length = value.length();
            height = Integer.parseInt(value.substring(0, length-2));
            return (height <= 193 && height >= 150);
        } else {
            return false;
        }
    }

    public static boolean checkYear(String value, int min, int max) {
        int year = Integer.parseInt(value);
        return (year <= max && year >= min);
    }

    public static boolean checkPassport(String pass) {
        if (pass.contains("byr") && pass.contains("iyr") && pass.contains("eyr") && pass.contains("hgt") && pass.contains("hcl") && pass.contains("ecl") && pass.contains("pid")) {
            String[] pairs = pass.split(" ");
            for (String keyvalue: pairs) {
                String[] keyvalues = keyvalue.split(":");
                switch(keyvalues[0]) {
                    case "byr" :
                        if (checkYear(keyvalues[1], 1920, 2002)) continue;
                        return false;
                    case "iyr" :
                        if (checkYear(keyvalues[1], 2010, 2020)) continue;
                        return false;
                    case "eyr" : 
                        if (checkYear(keyvalues[1], 2020, 2030)) continue;
                        return false;
                    case "hgt" :
                        if (checkHGT(keyvalues[1])) continue;
                        return false;
                    case "hcl" :
                        if (checkHCL(keyvalues[1])) continue;
                        return false;
                    case "ecl" : 
                        if (checkECL(keyvalues[1])) continue;
                        return false;
                    case "pid" : 
                        if (checkPID(keyvalues[1])) continue;
                        return false;
                    default : 
                        continue;
                }
            }
            return true;
        } else {
            return false;
        }
    }

    public static void main(String args[]) throws FileNotFoundException {
        int validPassport = 0;
        Scanner scan  = new Scanner(new File("day4.txt"));
        String pass = "";
        while(scan.hasNextLine()) {
            String read = scan.nextLine();
            if (read.length() == 0) {
                if (checkPassport(pass)) ++validPassport;
                pass = ""; 
            } else {
                pass = pass.concat(" ");
                pass = pass.concat(read);
            }
        }
        System.out.println("" + validPassport);
    }
}