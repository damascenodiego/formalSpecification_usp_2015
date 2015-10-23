package efs_trabalho02_z3;

import java.util.Scanner;

public class Q01_TriangleChecker {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int a = in.nextInt();
		int b = in.nextInt();
		int c = in.nextInt();
		System.out.println(triangleType(a,b,c));
	}

	private static int triangleType(int a, int b, int c) {
		if	(	
			!(((a+b) > c) ||((b+c) > a) || ((c+a) > b) || (a>0) || (b>0) || (c>0)) // ! valid
			){
			return -1;
		}else if	(	
				(((a+b) > c) ||((b+c) > a) || ((c+a) > b) || (a>0) || (b>0) || (c>0))	// valid 
				&&
				((a == b) && (b ==c)) // equilateral
				){
			return 0;
		}else if	(	
				(((a+b) > c) ||((b+c) > a) || ((c+a) > b) || (a>0) || (b>0) || (c>0))	// valid 
				&&
				!((a == b) && (b ==c)) // equilateral
				&& ((a == b) ^ (a ==c) ^ (b ==c)) // isosceles
				){
			return 1;
		}else if	(	
				(((a+b) > c) ||((b+c) > a) || ((c+a) > b) || (a>0) || (b>0) || (c>0))	// valid 
				&&
				!((a == b) && (b ==c)) // equilateral
				&& 
				!((a == b) ^ (a ==c) ^ (b ==c)) // isosceles
				){
			return 2;
		}
		return -1;
	}
}
