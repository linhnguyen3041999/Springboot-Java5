package com.PS11390_NguyenTungNhatLinh_ASM.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.PS11390_NguyenTungNhatLinh_ASM.converter.UserConverter;
import com.PS11390_NguyenTungNhatLinh_ASM.dto.UserDTO;
import com.PS11390_NguyenTungNhatLinh_ASM.service.MailerService;
import com.PS11390_NguyenTungNhatLinh_ASM.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserConverter userConverter;
	
	@Autowired
	MailerService mailService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@GetMapping("/forgot-pass")
	public String forgot() {
		return "login/forgot-pass";
	}
	
	@GetMapping("/logout")
	public String doGetLogout(HttpSession session) {
		session.removeAttribute("currentUser");
		return "redirect:/home";
	}
	
	@GetMapping("/signup")
	public String signUp(@ModelAttribute("model") UserDTO dto) {
		return "login/signup";
	}
	
	@PostMapping("/forgot-pass")
	public String sendPass(@RequestParam("email") String email, @RequestParam("username") String username ) {
		String randomPass = RandomStringUtils.randomAlphanumeric(6);
		UserDTO userDTO = userService.findByUsername(username);
		if(userDTO == null) {
			return "redirect:/login?sendmail=fail";
		}
		userDTO.setHashPassword(randomPass);
		userService.save(userDTO);
		try {
			mailService.send(email, "Send your new password!", "Password của bạn là: "+randomPass);
		} catch (Exception e) {
			System.out.print(e);
		}
		return "redirect:/login?sendmail=success";
	}
	
	@PostMapping("/signup")
	public String doPostSignUp(@ModelAttribute("model") UserDTO dto) {
		dto.setRoleCode("user");
		dto = userService.save(dto);
		return "redirect:/login?signup=success";
	}
	
	@PostMapping(value="/checklogin")
	public String checkLogin(@RequestParam("username") String username,@RequestParam("password") String password) {
		UserDTO userDTO = userService.login(username, password);

		if( userDTO != null) {
			session.setAttribute("currentUser", userDTO);
			String ruri = (String) session.getAttribute("redirect-uri");
			if(ruri != null) {
				session.removeAttribute("redirect-uri");
				return "redirect:"+ruri;
			}
				return "redirect:home";
		}
		return "redirect:/login?massage=fail";
	}
	
	
}
