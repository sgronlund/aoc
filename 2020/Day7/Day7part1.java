import java.util.*;
import java.io.*;

public class Day7part1 {


    public static boolean checkBagInBag(ArrayList<String> goldBags, String input) {
        for (String goldBag: goldBags) {
            if(input.contains(goldBag)) return true;
        }
        return false;
    }

    public static void main(String[] args) throws FileNotFoundException {
        long counter = 0;
        ArrayList<String> goldBags = new ArrayList<String>();
        while (true) {
            long old = counter;
            Scanner scan = new Scanner(new File("day7.txt"));
            while(scan.hasNextLine()) {
                String read = scan.nextLine();
                if (!(read.contains("no other"))) {
                    String[] words = read.split(" ");
                    String currentCol = words[0] + " " + words[1];
                    if (read.contains("shiny gold") && !(currentCol.equals("shiny gold")) || checkBagInBag(goldBags, read)) { 
                            if(!goldBags.contains(currentCol)) {
                                counter++;
                                goldBags.add(currentCol);
                            } else {
                                goldBags.add(currentCol);
                            }
                    }
                } else {
                    continue;
                }
            }
            if (old == counter) break;
        }
        System.out.println("Size var " + counter);
    }
}
