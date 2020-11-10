import java.util.Random;
import java.util.Scanner;
public class pie {

	public static void main(String[] args) {
		double n = 0.0, incircle = 0.0;
		double x=0, y=0;
		Scanner scan = new Scanner(System.in);
		Random random = new Random();
		n = scan.nextInt();
		for(int i=0; i<n; i++) {
			x = random.nextDouble();
			y = random.nextDouble();
			if(x*x+y*y<1) incircle+=1;
		}
		System.out.println(incircle/n*4);
	}

}
