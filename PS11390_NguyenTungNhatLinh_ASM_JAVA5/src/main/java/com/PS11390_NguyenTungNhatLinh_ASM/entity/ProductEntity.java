package com.PS11390_NguyenTungNhatLinh_ASM.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity {

	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "quantity")
	private Integer quantity;
	
	@Column(name = "imgurl")
	private String imgUrl;
	
	@Column(name = "description")
	private String description;
	
	@Column(name="status")
	private String status;
	
	@Column(name = "isdeleted")
	private Boolean isDeleted;
	
	@ManyToOne
	@JoinColumn(name="categoryid")
	private CategoryEntity categoryId;
	
	@OneToMany(mappedBy = "productId")
	private List<OrderDetailEntity> orderDetails = new ArrayList<>();

}
