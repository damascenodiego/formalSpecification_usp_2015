package efs_trabalho02_z3;

import static org.junit.Assert.*;

import org.junit.Test;

public class TestQ02_GCD {

	@Test
	public void test01() {
		Q02_GCD test = new Q02_GCD();
		
		int a = 0;
		int b = 1;
		int c = 0;
		int expected = 1;
		assertEquals(expected, test.gcd(a, b, c));
	}
	
}
