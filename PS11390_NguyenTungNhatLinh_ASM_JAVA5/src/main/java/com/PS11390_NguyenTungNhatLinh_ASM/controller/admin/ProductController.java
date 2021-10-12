package com.PS11390_NguyenTungNhatLinh_ASM.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.CategoryDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.dto.ProductDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.entity.CategoryEntity;
import com.PS11390_NguyenTungNhatLinh_ASM.service.CategoryService;
import com.PS11390_NguyenTungNhatLinh_ASM.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/product/list")
	public String list(Model model) {
		List<ProductDTO> dto = productService.findAll();
		model.addAttribute("items", dto);
		return "viewsofadmin/listproduct";
	}
	
	@RequestMapping("/product/edit")
	public String edit(@RequestParam(value="id", required = false) Long id ,Model model) {
		
		ProductDTO productDTO = new ProductDTO();
		List<String> listCode = new ArrayList<>();
		List<CategoryDTO> categoryDTO = categoryService.findAll();
		for(CategoryDTO item : categoryDTO) {
			listCode.add(item.getCode());
		}
		
		List<String> listStatus = new ArrayList<>();
		listStatus.add("còn hàng");
		listStatus.add("hết hàng");
//		if(id != null) {
//			categoryDTO = productService.findById(id);
//		}
		model.addAttribute("listCategoryCode",listCode);
		model.addAttribute("listStatus",listStatus);
		model.addAttribute("model",productDTO);
		return "viewsofadmin/editproduct";
	}
}
