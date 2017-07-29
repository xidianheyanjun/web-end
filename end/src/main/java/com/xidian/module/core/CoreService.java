package com.xidian.module.core;

import com.qcloud.sms.SmsSingleSender;
import com.qcloud.sms.SmsSingleSenderResult;
import com.sun.mail.util.MailSSLSocketFactory;
import com.xidian.dataAccess.Dao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Properties;

@Service("CoreService")
public class CoreService {
    private Logger logger = Logger.getLogger(getClass());

    @Value("#{config[mail_transport_protocol]}")
    private String mailTransportProtocol;

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

    @Value("#{config[mail_smtp_ssl_enable]}")
    private String mailSmtpSslEnable;

    @Autowired
    private Dao dao;

    public static void main(String[] a) throws Exception {
        CoreService CoreService = new CoreService();
        CoreService.sendSms();
    }

    public boolean sendSms() throws Exception {
        SmsSingleSender singleSender = new SmsSingleSender(1400033948, "6ae48758520d67b596053de7fa5dc083");
        ArrayList<String> params = new ArrayList<>();
        SmsSingleSenderResult singleSenderResult = singleSender.sendWithParam("86", "13692141127", 27348, params, "", "", "");
        logger.info(singleSenderResult);
        return true;
    }

    public boolean sendEmail(String to, String subject, String content) {
        logger.info(String.format("%s|%s|%s", to, subject, content));
        Properties props = new Properties();
        props.put("mail.transport.protocol", mailTransportProtocol);
        props.put("mail.smtp.auth", mailSmtpAuth);
        props.put("mail.smtp.host", mailSmtpHost);
        props.put("mail.smtp.port", mailSmtpPort);
        props.put("mail.user", mailFromUsername);
        props.put("mail.password", mailFromPassword);
        MailSSLSocketFactory sf = null;
        try {
            sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
        } catch (GeneralSecurityException e1) {
            e1.printStackTrace();
        }
        props.put("mail.smtp.ssl.enable", mailSmtpSslEnable);
        props.put("mail.smtp.ssl.socketFactory", sf);
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