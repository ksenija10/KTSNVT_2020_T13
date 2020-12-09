package com.kts.nvt.serbioneer.mailsender;

import java.util.Locale;
import java.util.Set;

import org.springframework.context.ApplicationEvent;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.News;

import lombok.Getter;
import lombok.Setter;

public class OnNewsCreatedEvent extends ApplicationEvent {

	@Getter
    @Setter
    private String appUrl;

    @Getter
    @Setter
    private Locale locale;
	
	@Getter
    @Setter
    private News news;
	
	@Getter
	@Setter
	private Set<AuthenticatedUser> subscribedUsers;
	
	public OnNewsCreatedEvent(News news, Locale locale, String appUrl, 
								Set<AuthenticatedUser> subscribedUsers) {
		super(news);
		
		this.appUrl = appUrl;
		this.locale = locale;
		this.news = news;
		this.subscribedUsers = subscribedUsers;
    }

}