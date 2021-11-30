import java.util.*;
import java.io.*;

public class Day5part1v2 {
    public static void main(String args[]) throws FileNotFoundException {
        int seatID = 0;
        Scanner scan = new Scanner(new File("day5.txt"));
        ArrayList<Integer> seatList = new ArrayList<Integer>();
        while (scan.hasNextLine()) {
            String binary = "";
            String seat = scan.nextLine();
            for(int i = 0; i < seat.length(); ++i) {
                char current = seat.charAt(i);
                if (current == 'F' || current == 'L') {
                    binary = binary + "0";
                } else {
                    binary = binary + "1";
                }
                int newSeat = Integer.parseInt(binary, 2);
                seatList.add(newSeat);
                if (newSeat > seatID) {
                    seatID = newSeat;
                }
            }
        }
        Collections.sort(seatList);
        System.out.println(seatList.toString());
        System.out.println("" + seatID);
    }
}
