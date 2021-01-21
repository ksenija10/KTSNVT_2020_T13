package com.kts.nvt.serbioneer.service;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.mailsender.OnNewsCreatedEvent;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import com.kts.nvt.serbioneer.repository.NewsRepository;


@Service
public class NewsService implements ServiceInterface<News> {

	@Autowired
	NewsRepository newsRepository;

	@Autowired
	AuthenticatedUserRepository userRepository;

	@Autowired
	CulturalSiteService culturalSiteService;
	
	@Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    Environment env;

	private final String type = "News";

	public List<News> findAll() {
		return newsRepository.findAll();
	}

	@Override
	public Page<News> findAll(Pageable pageable) {
		return newsRepository.findAll(pageable);
	}

	public List<News> findAllByCulturalSiteId(Long id) {
		return newsRepository.findAllByCulturalSiteId(id);
	}

	public Page<News> findAllByCulturalSiteId(Pageable pageable, Long culturalSiteId) {
		return newsRepository.findAllByCulturalSiteId(pageable, culturalSiteId);
	}

	@Override
	public News findOneById(Long id) {
		return newsRepository.findById(id).orElse(null);
	}

	public News create(Long culturalSiteId, News news) throws Exception{
		//check if cultural site with given id exists
			CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			throw new NonexistentIdException(culturalSiteService.getType());
		}
		news.setDateTime(new Date());
		news.setCulturalSite(culturalSite);
		return newsRepository.save(news);
	}

	@Override
	public void delete(Long id) throws Exception {
		News existingNews = newsRepository.findById(id).orElse(null);
		if (existingNews == null){
			throw new NonexistentIdException(this.type);
		}
		newsRepository.delete(existingNews);
	}

	public News update(News entity, Long id) throws Exception {
		News newsToUpdate = newsRepository.findById(id).orElse(null);
		if (newsToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		newsToUpdate.setInformation(entity.getInformation());
		return newsRepository.save(newsToUpdate);
	}

	public Page<News> getAllSubscribedNews(Pageable pageable, Long userId) throws Exception {
		AuthenticatedUser user = userRepository.findById(userId).orElse(null);

		if(user == null) {
			throw new NonexistentIdException("user");
		}

		return newsRepository.findAllByCulturalSiteInOrderByDateTimeDesc(user.getSubscribedSites(), pageable);
	}
	
	/*
	 * postavljeno u servisu kako bi se asinhrono pozvalo slanje mejla 
	 */
	@Async
    @Transactional
	public void sendNewsNotification(News news) throws MessagingException{
		mailSender.setUsername(env.getProperty("spring.mail.username"));
		mailSender.setPassword(env.getProperty("spring.mail.password"));

		String url = "http://localhost:8080" + "/api/cultural-site/" + 
												news.getCulturalSite().getId();
		
		String subject = "News about " + news.getCulturalSite().getName();
		
		MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper email = new MimeMessageHelper(mimeMessage, "utf-8");
        
        email.setFrom(env.getProperty("spring.mail.username"));
        
        for (AuthenticatedUser user : news.getCulturalSite().getSubscribedUsers()) {
			email.addTo(user.getEmail());
		}
        
        email.setSubject(subject);
        
        String title = "News about " + news.getCulturalSite().getName() + ":\n";
        String newsContent = "\t\t\""+ news.getInformation() +"\"";
        String link = "See everything about " + news.getCulturalSite().getName() + " on this link: " + url;
        
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
