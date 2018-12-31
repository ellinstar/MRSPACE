package com.space.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin")
public class AdminGraphController {
	
	public String showGraph() {
		System.out.println("graph controller");
		return "/admin/graph/highchart";
	}
	
	@RequestMapping(value="/graph", method=RequestMethod.GET)
	public String showjqPlot() {
		System.out.println("jqplot");
		return "/admin/graph/jqplot";
	}
}
