package com.xidian.module.core;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.xidian.dataAccess.Dao;

@Service("CoreService")
public class CoreService {
	private Logger logger = Logger.getLogger(getClass());

	@Value("#{config[mail_smtp_auth]}")
	private String mailSmtpAuth;

	@Value("#{config[mail_smtp_host]}")
	private String mailSmtpHost;

	@Value("#{config[mail_smtp_port]}")
	private String mailSmtpPort;

	@Value("#{config[mail_from_username]}")
	private String mailFromUsername;

	@Value("#{config[mail_from_nickname]}")
	private String mailFromNickname;

	@Value("#{config[mail_from_password]}")
	private String mailFromPassword;

	@Autowired
	private Dao dao;

	public boolean sendEmail(String to, String subject, String content) {
		logger.info(String.format("%s|%s|%s", to, subject, content));
		Properties props = new Properties();
		props.put("mail.smtp.auth", mailSmtpAuth);
		props.put("mail.smtp.host", mailSmtpHost);
		props.put("mail.smtp.port", mailSmtpPort);
		props.put("mail.user", mailFromUsername);
		props.put("mail.password", mailFromPassword);
		Authenticator authenticator = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailFromUsername,
						mailFromPassword);
			}
		};
		Session session = Session.getDefaultInstance(props, authenticator);
		session.setDebug(true);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mailFromUsername,
					mailFromNickname, "UTF-8"));
			message.setRecipient(MimeMessage.RecipientType.TO,
					new InternetAddress(to, "", "UTF-8"));
			message.setSubject(subject, "UTF-8");
			message.setContent(content, "text/html;charset=UTF-8");
			Transport.send(message);
		} catch (NoSuchProviderException e) {
			logger.error(e);
			return false;
		} catch (UnsupportedEncodingException e) {
			logger.error(e);
			return false;
		} catch (MessagingException e) {
			logger.error(e);
			return false;
		}
		return true;
	}

}