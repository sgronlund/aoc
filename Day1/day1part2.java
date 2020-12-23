import java.io.*;
import java.util.*;

public class day1part2 {

	public static void main(String args[]) throws FileNotFoundException {
	Scanner scan = new Scanner(new File("input.txt"));
	int first = 0;
	int second = 0;
	int third  = 0;
	int result = 0;
	ArrayList<Integer> list = new ArrayList<Integer>();
	while (scan.hasNextInt()) {
		list.add(scan.nextInt());
	}
	for (int i = 0; i < list.size() - 1; ++i) {
		first = list.get(i);
		for (int j = 0; j < list.size() - 1; ++j) {
			second = list.get(j);
			for (int k = 0; k < list.size() - 1; ++k) {
				third = list.get(k);
				if (first + second + third == 2020) {
					result = first*second*third;
				}
			}
		}	
	}
	System.out.println("Resultatet var " + result);
	}
}