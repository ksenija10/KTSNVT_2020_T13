package com.kts.nvt.serbioneer.registration;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import lombok.Getter;
import lombok.Setter;
import org.springframework.context.ApplicationEvent;

import java.util.Locale;

public class OnRegistrationCompleteEvent extends ApplicationEvent {

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
