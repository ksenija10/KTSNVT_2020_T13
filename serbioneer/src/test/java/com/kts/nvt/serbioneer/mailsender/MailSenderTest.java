package com.kts.nvt.serbioneer.mailsender;

import com.icegreen.greenmail.junit.GreenMailRule;
import com.icegreen.greenmail.util.GreenMailUtil;
import com.icegreen.greenmail.util.ServerSetupTest;
import org.junit.Rule;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

import javax.mail.internet.MimeMessage;


public class MailSenderTest {

    @Rule
    public final GreenMailRule greenMail = new GreenMailRule(ServerSetupTest.ALL);

    @Test
    public void sendMailTest(){
        GreenMailUtil.sendTextEmailTest("igi.l.1999@gmail.com", "serbioneer@gmail.com", "Ima li koga", "Samo babaroga");
        MimeMessage[] emails = greenMail.getReceivedMessages();

        assertEquals(1, emails.length);
    }
}
