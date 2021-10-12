package com.PS11390_NguyenTungNhatLinh_ASM.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.CategoryDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.dto.UserDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.entity.CategoryEntity;
import com.PS11390_NguyenTungNhatLinh_ASM.service.CategoryService;
import com.PS11390_NguyenTungNhatLinh_ASM.service.UserService;

@Controller(value="controllerOfAdmin")
public class HomeController {
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = "/category/list")
	public String list(Model model) {
		List<CategoryDTO> categoryDTO = categoryService.findAll();
		model.addAttribute("list", categoryDTO);
		return "viewsofadmin/listcategory";
	}
	
	@RequestMapping("/category/edit")
	public String edit(@RequestParam(value="id", required = false) Long id ,Model model) {
		CategoryDTO categoryDTO = new CategoryDTO();
		if(id != null) {
			categoryDTO = categoryService.findById(id);
		}
		model.addAttribute("model",categoryDTO);
		return "viewsofadmin/editcategory";
	}
	
}
