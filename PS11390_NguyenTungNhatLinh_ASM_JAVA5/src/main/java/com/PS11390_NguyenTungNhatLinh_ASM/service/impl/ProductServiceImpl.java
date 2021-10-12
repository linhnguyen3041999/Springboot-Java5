package com.PS11390_NguyenTungNhatLinh_ASM.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.PS11390_NguyenTungNhatLinh_ASM.converter.ProductConverter;
import com.PS11390_NguyenTungNhatLinh_ASM.dto.ProductDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.entity.ProductEntity;
import com.PS11390_NguyenTungNhatLinh_ASM.repository.ProductRepository;
import com.PS11390_NguyenTungNhatLinh_ASM.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ProductConverter productConverter;

	@Override
	public List<ProductDTO> findAll() {
		List<ProductEntity> entities =  productRepository.findAll();
		List<ProductDTO> dtos = new ArrayList<>();
		for (ProductEntity item : entities) {
			ProductDTO dto = new ProductDTO();
			dto = productConverter.toDTO(item);
			dtos.add(dto);
		}
		return dtos;
	}
	
	@Override
	public List<ProductDTO> findByIsDeletedTrue() {
		List<ProductEntity> entities = productRepository.findByIsDeletedTrue();
		List<ProductDTO> dtos = new ArrayList<>();
		for (ProductEntity item : entities) {
			ProductDTO dto = new ProductDTO();
			dto = productConverter.toDTO(item);
			dtos.add(dto);
		}
		return dtos;
	}

	@Override
	public ProductDTO save(ProductDTO dto) {
		ProductEntity entity = new ProductEntity();
		entity = productConverter.toEntity(dto);
		entity = productRepository.save(entity);
		return dto;
	}

	@Override
	public void deleted(Long id) {
		productRepository.deleteById(id);
	}

	@Override
	public ProductDTO findById(Long id) {
		Optional<ProductEntity> entity =  productRepository.findById(id);
		if(entity != null) {
			ProductDTO dto = new ProductDTO();
			BeanUtils.copyProperties(entity, dto);
			return dto;
		}
		return null;
	}

}
