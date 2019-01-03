package com.space.admin.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.JsonbHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("chartjs");
		List<CompVO> cpname = adResServ.optionCp();//select option 값 불러오기
		model.addAttribute("cp", cpname);
		return "/admin/graph/chartjs";
	}
	@RequestMapping(value="cpgraph", method=RequestMethod.GET)
	public String getCpGraph(HttpSession session, Model model) {
		String cpNum = (String)session.getAttribute("cpNum");
		Gson gson = new Gson();
		System.out.println("cpNum"+cpNum);
		List<ReservVO> cpgraph = adResServ.graphCp(cpNum);
		model.addAttribute("list", cpgraph);
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
