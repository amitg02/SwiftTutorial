//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//public class Circle {
//	
// 
//	
//	public static void main(String[] args) {
//	
//	Scanner scan = new Scanner(System.in);
//	
//	int t = scan.nextInt();
//	char a[][] = new char[t][t];
//	
//	if (t <= 2) {
//	System.out.println(0);
//	} else {
//	int r = 0;
//	
//	if (t % 2 == 0)
//	r = (t / 2) – 1;
//	else
//	r = t / 2;
//	scan.nextLine();
//	int k = 0;
//	for (int i = 0; i < t; i++) {
//	String str = scan.nextLine();
//	
//	a[k] = str.toCharArray();
//	k++;
//	}
//	
//	int finalrad = r;
//	boolean b = false;
//	for (int z = r; z > 0; z–) {
//	if (b == true)
//	break;
//	// System.out.println(“radisu z = “+z);
//	for (int i = z; i < t – z; i++) {
//	if (b == true)
//	break;
//	for (int j = z; j < t – z; j++) {
//	// System.out.println(“i “+i + ” j “+j);
//	b = checkCircle(a, t, z, i, j);
//	// System.out.println(“b “+b + “z “+ z);
//	if (b == true) {
//	// System.out.println(“b “+b);
//	finalrad = z;
//	break;
//	}
//	
//	}
//	}
//	
//	}
//	
//	if (b == true)
//	System.out.println(finalrad);
//	else
//	System.out.println(0);
//	
//	}
//	}
//	
//}