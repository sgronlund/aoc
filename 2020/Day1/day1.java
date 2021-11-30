import java.util.*;
import java.io.*;


public class day1 {

	public static void main(String args[]) throws FileNotFoundException{
		Scanner scan = new Scanner(new File("input.txt"));
		int first = 0;
		int result = 0;
		ArrayList<Integer> list = new ArrayList<Integer>();
		while (scan.hasNextInt()) {
			list.add(scan.nextInt());
		}
		for (int i = 0; i < list.size() - 1; ++i) {
			first = list.get(i);
			for (int j = 0; j < list.size() - 1; ++j) {
				if (first + list.get(j) == 2020) {
					result = first*list.get(j);
					break;
				}
			}
			if (result != 0) {
				break;
			}
		}
		System.out.println("Resultatet var " + result);
	}

}