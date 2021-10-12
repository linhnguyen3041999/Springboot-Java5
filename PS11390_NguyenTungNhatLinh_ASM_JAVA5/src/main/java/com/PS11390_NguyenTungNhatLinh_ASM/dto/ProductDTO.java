package com.PS11390_NguyenTungNhatLinh_ASM.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO extends AbtractDTO<ProductDTO>{
	
	private String name;
	private String code;
	private Double price;
	private Integer quantity;
	private String imgUrl;
	private MultipartFile imageFile;
	private String description;
	private String status;
	private Boolean isDeleted;
	private String categoryCode;
	
}
