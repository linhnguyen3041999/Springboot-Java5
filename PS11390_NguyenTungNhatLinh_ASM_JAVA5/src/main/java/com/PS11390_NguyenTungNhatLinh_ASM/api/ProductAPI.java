package com.PS11390_NguyenTungNhatLinh_ASM.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.ProductDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.service.ProductService;

@RestController
public class ProductAPI {

	@Autowired
	ProductService productService;

	@PostMapping("/api/product")
	public ProductDTO create(@RequestBody ProductDTO model) {
		return productService.save(model);
	}

	@PutMapping("/api/product")
	public ProductDTO update(@RequestBody ProductDTO model) {
		return productService.save(model);
	}

	@DeleteMapping("/api/product")
	public void delete(@RequestBody Long id) {
		productService.deleted(id);
	}
}
