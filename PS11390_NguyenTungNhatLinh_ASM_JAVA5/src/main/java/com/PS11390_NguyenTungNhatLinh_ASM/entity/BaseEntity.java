package com.PS11390_NguyenTungNhatLinh_ASM.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import lombok.Data;

@Data
@MappedSuperclass
public abstract class BaseEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
//	@Column(name="createdy")
	@Column
	private String createdBy;
	
//	@Column(name="modifiedby")
	@Column
	private String modifiedBy;
	
//	@Column(name="createddate")
	@Column
	private Date createdDate;
	
//	@Column(name="modifiedby")
	@Column
	private Date modifiedDate;
}
