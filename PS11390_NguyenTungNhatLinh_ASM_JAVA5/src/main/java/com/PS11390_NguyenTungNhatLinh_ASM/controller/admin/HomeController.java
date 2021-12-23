package com.PS11390_NguyenTungNhatLinh_ASM.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.PS11390_NguyenTungNhatLinh_ASM.service.StatsService;

import net.minidev.json.JSONObject;

@Controller(value = "homeControllerOfAdmin")
@RequestMapping("/admin/")
public class HomeController {
	
	@Autowired
	private StatsService statsService;

	@GetMapping("home")
	public String doGetIndex(Model model) {
		String[][] chartData = statsService.getTotalPriceLast6Months();
		model.addAttribute("chartData", chartData);
		return "viewsofadmin/home";
	}
}
