package com.space.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	
	public String showjqPlot() {
		System.out.println("jqplot");
		return "/admin/graph/jqplot";
	}
	@RequestMapping(value="/graph", method=RequestMethod.GET)
	public String chartjs() {
		System.out.println("chartjs");
		return "/admin/graph/chartjs";
	}
	   /* public String getDailyVisitor(HttpSession session, String month){
	        String cooContractNo = (String) session.getAttribute("setNo");
	  //      Gson gson = new Gson();
	        HashMap<String,String> map = new HashMap<String,String>();
	        
	        map.put("cooContractNo",cooContractNo);
	        map.put("month", month);
	 
	//        List<PartnerStatsDto> list= partnerDao.selectDailyVisitor(map);
	        
	        return gson.toJson(list);
	 
	    }*/
}
