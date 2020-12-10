package com.kts.nvt.serbioneer.registration;

import java.util.Locale;

import org.springframework.context.ApplicationEvent;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;

import lombok.Getter;
import lombok.Setter;

public class OnRegistrationCompleteEvent extends ApplicationEvent {

	private static final long serialVersionUID = 1L;

	@Getter
    @Setter
    private String appUrl;

    @Getter
    @Setter
    private Locale locale;

    @Getter
    @Setter
    private AuthenticatedUser authenticatedUser;

    public OnRegistrationCompleteEvent(
            AuthenticatedUser authenticatedUser, Locale locale, String appUrl) {
        super(authenticatedUser);

        this.authenticatedUser = authenticatedUser;
        this.locale = locale;
        this.appUrl = appUrl;
    }

}
