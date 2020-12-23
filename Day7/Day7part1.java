import java.util.*;
import java.io.*;

public class Day7part1 {

    public static void main(String[] args) throws FileNotFoundException {
        long counter = 0;
        ArrayList<String> goldBags = new ArrayList<String>();
        ArrayList<String> bagsWithGoldBags = new ArrayList<String>();
        Scanner scan = new Scanner(new File("day7.txt"));
        while(scan.hasNextLine()) {
            String read = scan.nextLine();
            if (!(read.contains("no other"))) {
                String[] words = read.split(" ");
                String currentCol = words[0] + " " + words[1];
                if (read.contains("shiny gold") && !(currentCol.equals("shiny gold"))) { 
                        goldBags.add(currentCol);
                }
            } else {
                continue;
            }
        }
        scan.reset();
        for (String gold: goldBags) {
            while(scan.hasNextLine()) {
                String read = scan.nextLine();
                if (read.contains(gold)) {
                    bagsWithGoldBags.add(read);
                    ++counter;
                }
            }
        }
        System.out.println("Size var " + counter);
    }
}
