package com.PS11390_NguyenTungNhatLinh_ASM.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.PS11390_NguyenTungNhatLinh_ASM.entity.ProductEntity;
@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Long>{
	List<ProductEntity> findByIsDeletedTrue();
}