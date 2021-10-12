package com.PS11390_NguyenTungNhatLinh_ASM.service.impl;

import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.UserDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.entity.UserEntity;
import com.PS11390_NguyenTungNhatLinh_ASM.repository.UserRepository;
import com.PS11390_NguyenTungNhatLinh_ASM.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserRepository userRepository;
	
	private BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();

	@Override
	public UserDTO save(UserDTO dto) {
		UserEntity userEntity = new UserEntity();
//		if(dto.getId() != null) {
//			//Optional<UserEntity> entity = userRepository.findById(dto.getId());
//			//BeanUtils.copyProperties(dto, entity.get());
//			BeanUtils.copyProperties(dto, userEntity);
//		}else {
//			
//		}
		BeanUtils.copyProperties(dto, userEntity);
		userEntity.setHashPassword(bcrypt.encode(dto.getHashPassword()));
		userEntity = userRepository.save(userEntity);
		return dto;
	}

	@Override
	public UserDTO findById(Long id) {
		Optional<UserEntity> entity = userRepository.findById(id);
		UserDTO dto = new UserDTO();
		if(entity.isPresent()) {
			BeanUtils.copyProperties(entity.get(), dto);
			return dto;
		}
		return null;
	}

	@Override
	public void delete(Long id) {
		userRepository.deleteById(id);
	}

	@Override
	public UserDTO login(String username, String password) {
		UserDTO userDTO = findByUsername(username);
		boolean checkPass = false;
		if(!ObjectUtils.isEmpty(userDTO)) {
			String hashPass = userDTO.getHashPassword();
			checkPass = bcrypt.matches(password, hashPass);
		}
		return checkPass ? userDTO : null;
	}

	@Override
	public UserDTO findByUsername(String username) {
		UserEntity entity = userRepository.findByUsername(username);
		UserDTO dto = new UserDTO();
		if(entity != null) {
			BeanUtils.copyProperties(entity, dto);
		}
		return null;
	}
	
	
}
