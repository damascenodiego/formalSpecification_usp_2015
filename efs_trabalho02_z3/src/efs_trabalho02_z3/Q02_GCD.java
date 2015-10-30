package efs_trabalho02_z3;

import java.util.Scanner;

public class Q02_GCD {
	
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int a = in.nextInt();
		int b = in.nextInt();
		int c = in.nextInt();
		System.out.println(gcd(a,b,c));

	}

	public static int gcd(int a, int b, int c) {
		return gcd(a,gcd(b,c));
	}

	public static int gcd(int a, int b) {
		if(b==0) {
			return a;
		}
		else {
			return gcd(b, a % b);
		}
	}

}
