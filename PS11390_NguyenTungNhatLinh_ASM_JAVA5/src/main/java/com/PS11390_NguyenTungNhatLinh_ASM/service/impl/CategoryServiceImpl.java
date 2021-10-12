package com.PS11390_NguyenTungNhatLinh_ASM.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.CategoryDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.entity.CategoryEntity;
import com.PS11390_NguyenTungNhatLinh_ASM.repository.CategoryRepository;
import com.PS11390_NguyenTungNhatLinh_ASM.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryRepository categoryRepository;

	@Override
	public List<CategoryDTO> findAll() {
		List<CategoryEntity> entities = categoryRepository.findAll();
		List<CategoryDTO> dtos = new ArrayList<>();
		for (CategoryEntity item : entities) {
			CategoryDTO dto = new CategoryDTO();
			BeanUtils.copyProperties(item, dto);
			dtos.add(dto);
		}
		return dtos;
	}

	@Override
	public CategoryDTO save(CategoryDTO dto) {
		CategoryEntity entity = new CategoryEntity();
//		if (dto.getId() != null) {
//			Optional<CategoryEntity> oldCategory = categoryRepository.findById(dto.getId());
//			BeanUtils.copyProperties(dto, oldCategory.get());
//			BeanUtils.copyProperties(oldCategory.get(), entity);
//		} else {
//			BeanUtils.copyProperties(dto, entity);
//		}
		BeanUtils.copyProperties(dto, entity);
		entity = categoryRepository.save(entity);

		return dto;
	}

	@Override
	public void deleted(Long id) {
		categoryRepository.deleteById(id);
	}

	@Override
	public CategoryDTO findById(Long id) {
		Optional<CategoryEntity> entity = categoryRepository.findById(id);
		CategoryDTO dto = new CategoryDTO();
		if (entity.isPresent()) {
			BeanUtils.copyProperties(entity.get(), dto);
			return dto;
		}
		return null;
	}
}
