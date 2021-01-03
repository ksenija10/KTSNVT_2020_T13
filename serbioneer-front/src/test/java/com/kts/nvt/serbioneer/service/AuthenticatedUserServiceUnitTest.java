package com.kts.nvt.serbioneer.service;


import com.kts.nvt.serbioneer.helper.exception.ConflictException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.*;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import com.kts.nvt.serbioneer.repository.UserRepository;
import com.kts.nvt.serbioneer.repository.VerificationTokenRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.*;

import static com.kts.nvt.serbioneer.constants.AuthenticatedUserConstants.*;
import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.BDDMockito.given;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class AuthenticatedUserServiceUnitTest {

    @Autowired
    private AuthenticatedUserService authentiicatedUserService;

    @MockBean
    private CulturalSiteService culturalSiteService;

    @MockBean
    private AuthenticatedUserRepository authenticatedUserRepository;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    private VerificationTokenRepository verificationTokenRepository;


    @Before
    public void setup() {

        USER_BEFORE.setId(USER_ID);
        USER_AFTER.setId(USER2_ID);
        USER_AFTER.setEmail("novi");
        USER_BEFORE.setEmail("stari");
        USER.setEmail("user");
        USER.setId(USER3_ID);
        USER.setSubscribedSites(new HashSet<>());

        CulturalSite culturalSite = new CulturalSite("name", "address", "city",
                new CulturalCategoryType("type"), new CulturalSiteCategory("cat"));
        culturalSite.setId(CULTURAL_SITE_ID);

        CulturalSite culturalSite2 = new CulturalSite("name2", "address2", "city2",
                new CulturalCategoryType("type2"), new CulturalSiteCategory("cat2"));
        culturalSite.setId(CULTURAL_SITE_ID4);


        Set<CulturalSite> subscribedSites = new HashSet<>();
        subscribedSites.add(culturalSite);

        USER_BEFORE.setSubscribedSites(subscribedSites);

        CulturalSite culturalSite3 = new CulturalSite("name3", "address3", "city3",
                new CulturalCategoryType("type3"), new CulturalSiteCategory("cat3"));
        culturalSite3.setId(CULTURAL_SITE_ID3);

        Set<CulturalSite> subscribedSitesAfter = new HashSet<>();
        subscribedSitesAfter.add(culturalSite);
        subscribedSitesAfter.add(culturalSite3);

        USER_AFTER.setSubscribedSites(subscribedSitesAfter);

        given(authenticatedUserRepository.findById(USER_ID)).willReturn(java.util.Optional.of(USER_BEFORE));
        given(authenticatedUserRepository.findById(USER2_ID)).willReturn(java.util.Optional.of(USER_AFTER));
        given(authenticatedUserRepository.findById(USER3_ID)).willReturn(java.util.Optional.of(USER));
        given(authenticatedUserRepository.save(USER_BEFORE)).willReturn(USER_AFTER);

        given(culturalSiteService.findOneById(CULTURAL_SITE_ID)).willReturn(culturalSite);
        given(culturalSiteService.findOneById(CULTURAL_SITE_ID3)).willReturn(culturalSite3);
        given(culturalSiteService.findOneById(CULTURAL_SITE_ID4)).willReturn(culturalSite2);

        given(culturalSiteService.findAllSubscribed(USER_BEFORE)).willReturn(new ArrayList<>(subscribedSites));
        given(culturalSiteService.findAllSubscribed(USER_AFTER)).willReturn(new ArrayList<>(subscribedSitesAfter));
    }

    @Test
    public void testSubscribe() throws NonexistentIdException, ConflictException {
        List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(USER_BEFORE);
        authentiicatedUserService.addSubscribedSite(CULTURAL_SITE_ID3, USER_BEFORE);
        List<CulturalSite> citesAfter = culturalSiteService.findAllSubscribed(USER_AFTER);
        assertEquals(citesBefore.size()+1, citesAfter.size());

    }

    @Test(expected = ConflictException.class)
    public void testSubscribeNull() throws NonexistentIdException, ConflictException {
        AuthenticatedUser user = authentiicatedUserService.findOneById(USER_ID);
        assertNotNull(user);
        List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(user);
        authentiicatedUserService.addSubscribedSite(CULTURAL_SITE_ID5, user);
    }

    @Test
    public void testUnsubscribe() throws NonexistentIdException, ConflictException {
        List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(USER_AFTER);
        authentiicatedUserService.removeSubscribedSite(CULTURAL_SITE_ID3, USER_AFTER);
        List<CulturalSite> citesAfter = culturalSiteService.findAllSubscribed(USER_BEFORE);
        assertEquals(citesBefore.size()-1, citesAfter.size());
    }

    @Test(expected = ConflictException.class)
    public void testUnsubscribeNull() throws NonexistentIdException, ConflictException {
        List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(USER);
        authentiicatedUserService.removeSubscribedSite(CULTURAL_SITE_ID4, USER);
    }
}
