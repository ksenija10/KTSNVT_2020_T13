package com.kts.nvt.serbioneer.registration;

import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;

@Component
public class RegistrationListener implements
        ApplicationListener<OnRegistrationCompleteEvent> {

    @Autowired
    private AuthenticatedUserService service;

    @Autowired
    private MessageSource messages;

    @Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    Environment env;

    @Override
    public void onApplicationEvent(OnRegistrationCompleteEvent event) {
        try {
            this.confirmRegistration(event);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    @Async
    @Transactional
    private void confirmRegistration(OnRegistrationCompleteEvent event) throws MessagingException {
        AuthenticatedUser user = event.getAuthenticatedUser();
        String token = UUID.randomUUID().toString();
        service.createVerificationToken(user, token);

        String recipientAddress = user.getEmail();
        String subject = "Registration Confirmation";
        String confirmationUrl
                = event.getAppUrl() + "/api/registrationConfirm?token=" + token;

        mailSender.setUsername(env.getProperty("spring.mail.username"));
        mailSender.setPassword(env.getProperty("spring.mail.password"));

        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper email = new MimeMessageHelper(mimeMessage, "utf-8");

        email.setTo(recipientAddress);
        email.setSubject(subject);

        String htmlMsg = "<tbody><tr>\n" +
                "\n" +
                "<td style=\"outline:none;width:100%;color:#17181a;font-family:'FreightSans Pro','Segoe UI','SanFrancisco Display',Arial,sans-serif;font-size:26px;font-style:normal;font-weight:normal;line-height:30px;word-spacing:0;margin:0;padding:60px 120px 0\" align=\"center\" valign=\"top\">\n" +
                "\n" +
                "Welcome to Serbioneer!\n" +
                "\n" +
                "</td>\n" +
                "\n" +
                "</tr>\n" +
                "\n" +
                "<tr>\n" +
                "\n" +
                "<td style=\"outline:none;width:100%;color:#797c7f;font-family:'Fakt Pro','Segoe UI','SanFrancisco Display',Arial,sans-serif;font-size:14px;font-style:normal;font-weight:normal;line-height:24px;word-spacing:0;margin:0;padding:50px 80px 0\" align=\"left\" valign=\"top\">\n" +
                "\n" +
                "<p style=\"outline:none;margin:0;padding:0\">Follow the link to complete your registration: " + "https://localhost:8080" + confirmationUrl +"</p>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "</td>\n" +
                "\n" +
                "</tr>\n" +
                "\n" +
                "<tr></tr>\n" +
                "\n" +
                "<tr><td style=\"outline:none;width:100%;color:#17181a;font-family:'FreightSans Pro','Segoe UI','SanFrancisco Display',Arial,sans-serif;font-size:18px;font-style:normal;font-weight:normal;line-height:24px;word-spacing:0;margin:0;padding:50px 80px\" align=\"left\" valign=\"top\">\n" +
                "\n" +
                "Explore Serbia easier with us!\n" +
                "\n" +
                "</td>\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "\n" +
                "                            \n" +
                "\n" +
                "                            \n" +
                "\n" +
                "\n" +
                "\n" +
                "                        </tr></tbody>";
        email.setText(htmlMsg, true);
        mailSender.send(mimeMessage);
    }
}