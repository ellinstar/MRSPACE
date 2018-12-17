package com.spring.common.page;

//import static org.junit.Assert.*;

import org.junit.Test;

public class PageTagTest {

	@Test
	public void test() {
		int page = 1;
		int page_size = 5;
		
		/* page가 1페이지이고 page_size(바로가기 번호)가 2이면 */
		/* currentFirst는 1 */
		int currentFirst = ((page-1)/page_size) * page_size + 1;
		System.out.println("currentFirst : "+currentFirst);
		
		/* currentlast는 2 */
		int currentlast = ((page-1)/page_size) * page_size + page_size;
		System.out.println("currentlast : "+currentlast);
		
		/* nextFirst는 3 */
		int nextFirst = (((page-1)/page_size)+1) * page_size + 1;
		System.out.println("nextFirst : "+nextFirst);
		
		/* prevLast는 -1  */
		int prevLast = (((page-1)/page_size)-1) * page_size + 1;
		System.out.println("prevLast : "+prevLast);
	}

}
