package com.spring.common.page;

//import static org.junit.Assert.*;

import org.junit.Test;

public class PageTagTest {

	@Test
	public void test() {
		int page = 1;
		int page_size = 5;
		
		/* page�� 1�������̰� page_size(�ٷΰ��� ��ȣ)�� 2�̸� */
		/* currentFirst�� 1 */
		int currentFirst = ((page-1)/page_size) * page_size + 1;
		System.out.println("currentFirst : "+currentFirst);
		
		/* currentlast�� 2 */
		int currentlast = ((page-1)/page_size) * page_size + page_size;
		System.out.println("currentlast : "+currentlast);
		
		/* nextFirst�� 3 */
		int nextFirst = (((page-1)/page_size)+1) * page_size + 1;
		System.out.println("nextFirst : "+nextFirst);
		
		/* prevLast�� -1  */
		int prevLast = (((page-1)/page_size)-1) * page_size + 1;
		System.out.println("prevLast : "+prevLast);
	}

}
