package com.PS11390_NguyenTungNhatLinh_ASM.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.UserDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
	

	@PostMapping(value="/checklogin")
	public String checkLogin(@RequestParam("username") String username,@RequestParam("password") String password) {
		UserDTO userDTO = new UserDTO();
		if(userService.login(username, password) != null) {
			return "redirect:category/list";
		}
		return "redirect:/login";
	}
}
