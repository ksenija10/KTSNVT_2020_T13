package com.kts.nvt.serbioneer.mailsender;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;

@Component
public class NewsListener implements ApplicationListener<OnNewsCreatedEvent>{

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
        
        String body = "News about " + event.getNews().getCulturalSite().getName() + ":\n";
        body += "\t\t\""+ event.getNews().getInformation() +"\"";
        
        body += "\n\nSee everything about " + event.getNews().getCulturalSite().getName() + " on this link: ";
        body += url + "\n\n";
        body += "Explore Serbia easier with us!";
        
        email.setText(body);
        mailSender.send(mimeMessage);
	}

}
