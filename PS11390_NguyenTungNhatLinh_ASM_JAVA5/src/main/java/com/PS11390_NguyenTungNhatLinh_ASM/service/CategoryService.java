package com.PS11390_NguyenTungNhatLinh_ASM.service;

import java.util.List;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.CategoryDTO;

public interface CategoryService {
	List<CategoryDTO> findAll();
	CategoryDTO save(CategoryDTO dto);
	void deleted(Long id);
	CategoryDTO findById(Long id);
}
