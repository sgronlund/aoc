import java.util.*;
import java.io.*;

public class Day6part2 {


    public static int checkMultiple(ArrayList<String> inputs) { // {a, a, a, a}
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int val;
        for(String check: inputs) {
            String[] split = check.split("");
            for(String key: split) {
                int val = map.remove(key);
                if (val != 0) {
                    map.put(key, val+1);
                } else {
                    map.put(key, 1);
                }
            }
        }
        for (int i = 0; i < map.values().size(); ++i) {
            val += map.values().get(i);
        }
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