package com.healpio.service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

    @Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("your-smtp-server-host");
        mailSender.setPort(587); // SMTP 포트 번호
        mailSender.setUsername("your-username");
        mailSender.setPassword("your-password");

        // 기타 설정 (SSL 등)

        return mailSender;
    }
}
