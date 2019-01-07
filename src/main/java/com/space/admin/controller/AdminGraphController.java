package com.space.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.space.admin.service.AdminResService;
import com.space.comp.vo.CompVO;
import com.space.reserv.vo.ReservVO;

@Controller
@RequestMapping(value="/admin")
public class AdminGraphController {
	
	@Autowired
	public AdminResService adResServ;
	
	@RequestMapping(value="/graph", method=RequestMethod.GET)
	public String chartjs(@ModelAttribute ReservVO rvo, Model model) {
		System.out.println("googlechart");
		List<ReservVO> cpgraph = adResServ.graphCp();
		model.addAttribute("list", cpgraph);
		return "/admin/graph/gchart";
	}
	
	public @ResponseBody String getCpGraph(@RequestParam("cpNum") int cp_Num, Model model) {
		Gson gson = new Gson();
		//HashMap<String, String> map = new HashMap<>();
		//map.put("cpNum", cpNum);
		List<ReservVO> cpgraph = adResServ.graphCp();
		model.addAttribute("list", cpgraph);
		gson.toJson(cpgraph);
		return gson.toJson(cpgraph);
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
