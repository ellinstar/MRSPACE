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
		List<ReservVO> allgraph = adResServ.graphAll();
		List<CompVO> optioncp = adResServ.optionCp();
		model.addAttribute("list", allgraph);
		model.addAttribute("cpop", optioncp);
		System.out.println("list"+allgraph);
		return "/admin/graph/gchart";
	}
	@RequestMapping(value="/graph",method=RequestMethod.POST)
	public @ResponseBody void getCpGraph(@RequestParam("cpNum") int cp_Num, Model model) {
		System.out.println("cpNum"+cp_Num);
		List<ReservVO> cpgraph = adResServ.graphCp(cp_Num);
		model.addAttribute("cpList", cpgraph);
	}
}
