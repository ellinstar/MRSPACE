package com.space.admin.page;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum=1;
	private int amount=10;
	private int search;
	
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("search", this.getSearch());
		
		return builder.toUriString();
	}
	
	
}
