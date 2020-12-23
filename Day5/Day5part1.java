import java.util.*;
import java.io.*;

public class Day5part1 {
    public static void main(String args[]) throws FileNotFoundException {
        double seatID = 0;
        double lowRow = 0;
        double highRow = 128;
        double lowColumns = 0;
        double highColumns = 8;
        double diff = 0;
        Scanner scan = new Scanner(new File("day5.txt"));
        while (scan.hasNextLine()) {
            String seat = scan.nextLine();
            for(int i = 0; i < seat.length(); ++i) {
                switch(seat.charAt(i)) {
                    case 'F' : 
                        diff = highRow - lowRow;
                        highRow -= Math.floor(diff / 2);
                        break;
                    case 'B' :
                        diff = highRow - lowRow;
                        lowRow += Math.floor(diff / 2);
                        break;
                    case 'R' :
                        diff = highColumns - lowColumns;
                        lowColumns += Math.floor(diff / 2);
                        break;
                    case 'L' :
                        diff = highColumns - lowColumns;
                        highColumns -= Math.floor(diff / 2);
                        break;
                    default : 
                        break;
                }
                double newSeat = lowRow * 8 + lowColumns;
                if (newSeat > seatID) {
                    seatID = newSeat;
                }
            }
            lowRow = 0;
            highRow = 128;
            lowColumns = 0;
            highColumns = 8;
        }
        System.out.println("" + seatID);
    }
}
