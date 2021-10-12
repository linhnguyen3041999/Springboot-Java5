package com.PS11390_NguyenTungNhatLinh_ASM.dto;

import java.util.ArrayList;
import java.util.List;

import com.PS11390_NguyenTungNhatLinh_ASM.entity.RoleEntity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO extends AbtractDTO<UserDTO> {
	
	private String username;
	private String hashPassword;
	private String fullname;
	private String email;
	private String imgUrl;
	private Boolean isDeleted;
	private List<RoleEntity> roles = new ArrayList<>();

}
