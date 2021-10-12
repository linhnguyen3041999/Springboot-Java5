package com.PS11390_NguyenTungNhatLinh_ASM.service;

import java.util.List;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.ProductDTO;

public interface ProductService {
	List<ProductDTO> findAll();
	List<ProductDTO> findByIsDeletedTrue();
	ProductDTO save(ProductDTO dto);
	void deleted(Long id);
	ProductDTO findById(Long id);
	
}
