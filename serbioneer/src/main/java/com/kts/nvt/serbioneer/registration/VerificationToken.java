package com.kts.nvt.serbioneer.registration;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Entity
public class VerificationToken {
    private static final int EXPIRATION = 60 * 24;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Getter
    @Setter
    private Long id;

    @Getter
    @Setter
    private String token;

    @Getter
    @Setter
    @OneToOne(targetEntity = AuthenticatedUser.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id")
    private AuthenticatedUser user;

    @Getter
    @Setter
    private Date expiryDate;

    private void calculateExpiryDate(int expiryTimeInMinutes) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Timestamp(cal.getTime().getTime()));
        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
        this.expiryDate = new Date(cal.getTime().getTime());
    }

    public VerificationToken(String token, AuthenticatedUser user) {
        this.token = token;
        this.user = user;
        this.calculateExpiryDate(1);

    }

    public boolean isExpired() {
        Calendar cal = Calendar.getInstance();
        return (this.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0;
    }
}