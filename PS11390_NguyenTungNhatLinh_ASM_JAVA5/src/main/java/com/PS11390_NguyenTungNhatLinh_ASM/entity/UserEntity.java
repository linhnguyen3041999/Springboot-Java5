package com.PS11390_NguyenTungNhatLinh_ASM.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table(name="user")
public class UserEntity extends BaseEntity{
	
	@Column(name="username")
	private String username;
	
	@Column(name="hashpassword")
	private String hashPassword;
	
	@Column(name="fullname")
	private String fullname;
	
	@Column(name="email")
	private String email;
	
	@Column(name="imgurl")
	private String imgUrl;
	
	@Column(name="isdeleted")
	private Boolean isDeleted;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "user_role", joinColumns =  @JoinColumn(name = "userid"), inverseJoinColumns = @JoinColumn(name="roleid"))
	private List<RoleEntity> roles = new ArrayList<>();
	
	@OneToMany(mappedBy = "userId")
	private List<OrderEntity> orders = new ArrayList<>();
	
}
