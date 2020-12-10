package com.kts.nvt.serbioneer.mailsender;

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
public class NewsListener implements ApplicationListener<OnNewsCreatedEvent> {

	@Autowired
    private AuthenticatedUserService service;

    @Autowired
    private MessageSource messages;

    @Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    Environment env;
	
	@Override
	public void onApplicationEvent(OnNewsCreatedEvent event) {
		try {
            this.sendNewsNotification(event);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}
	
	@Async
    @Transactional
	public void sendNewsNotification(OnNewsCreatedEvent event) throws MessagingException{
		mailSender.setUsername(env.getProperty("spring.mail.username"));
		mailSender.setPassword(env.getProperty("spring.mail.password"));

		String url = "http://localhost:8080" + "/api/cultural-site/" + 
												event.getNews().getCulturalSite().getId();
		
		String subject = "News about " + event.getNews().getCulturalSite().getName();
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper email = new MimeMessageHelper(mimeMessage, "utf-8");
        
        email.setFrom(env.getProperty("spring.mail.username"));
        
        for (AuthenticatedUser user : event.getSubscribedUsers()) {
			email.addTo(user.getEmail());
		}
        
        email.setSubject(subject);
        
        String title = "News about " + event.getNews().getCulturalSite().getName() + ":\n";
        String newsContent = "\t\t\""+ event.getNews().getInformation() +"\"";
        String link = "See everything about " + event.getNews().getCulturalSite().getName() + " on this link: " + url;
        
        String htmlMsg = "<tbody><tr>\n" +
                "\n" +
                "<td style=\"outline:none;width:100%;color:#17181a;font-family:'FreightSans Pro','Segoe UI','SanFrancisco Display',Arial,sans-serif;font-size:24px;font-style:normal;font-weight:normal;line-height:30px;word-spacing:0;margin:0;padding:60px 60px 0\" align=\"left\" valign=\"top\">\n" +
                "\n" +
                title +
                "</td>" +
                "</tr>\n\n" +
                "<tr>" + 
                "<td style=\"outline:none;width:100%;color:#17181a;font-family:'FreightSans Pro','Segoe UI','SanFrancisco Display',Arial,sans-serif;font-size:24px;font-style:normal;font-weight:normal;line-height:30px;word-spacing:0;margin:0;padding:60px 120px 0\" align=\"center\" valign=\"top\">\n" +
                "\n" +
                "<p style=\"outline:none;margin:0;padding:0;font-size:18px;\">"+ newsContent +"</p>\n" +
                "</td>\n" +
                "\n" +
                "</tr>\n" +
                "\n" +
                "<tr>\n" +
                "\n" +
                "<td style=\"outline:none;width:100%;color:#797c7f;font-family:'Fakt Pro','Segoe UI','SanFrancisco Display',Arial,sans-serif;font-size:14px;font-style:normal;font-weight:normal;line-height:24px;word-spacing:0;margin:0;padding:50px 80px 0\" align=\"left\" valign=\"top\">\n" +
                "\n" +
                "<p style=\"outline:none;margin:0;padding:0\">" + link +"</p>\n" +
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
