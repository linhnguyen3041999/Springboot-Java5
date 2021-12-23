package com.PS11390_NguyenTungNhatLinh_ASM.service;

import javax.mail.MessagingException;

import com.PS11390_NguyenTungNhatLinh_ASM.dto.MailInfo;

public interface MailerService {
	void send(MailInfo mail) throws MessagingException;
	void send(String to, String subject, String body) throws MessagingException;

}
