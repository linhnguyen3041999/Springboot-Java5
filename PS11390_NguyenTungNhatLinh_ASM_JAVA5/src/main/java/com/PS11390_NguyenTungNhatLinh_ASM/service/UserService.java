package com.PS11390_NguyenTungNhatLinh_ASM.service;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.UserDTO;

public interface UserService {
	UserDTO save(UserDTO dto);
	UserDTO findById(Long id);
	void delete(Long id);
	UserDTO login(String username, String password);
	UserDTO findByUsername(String username);
}
