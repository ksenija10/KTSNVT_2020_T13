package com.kts.nvt.serbioneer.service;

import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.exception.ConflictException;
import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.registration.VerificationToken;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import com.kts.nvt.serbioneer.repository.UserRepository;
import com.kts.nvt.serbioneer.repository.VerificationTokenRepository;

@Service
public class AuthenticatedUserService implements ServiceInterface<AuthenticatedUser> {

	@Autowired
	private AuthenticatedUserRepository authenticatedUserRepository;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private VerificationTokenRepository verificationTokenRepository;

	@Autowired
	private CulturalSiteService culturalSiteService;
	
	@Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    Environment env;
	
	private final String type = "Authenticated user";

	public List<AuthenticatedUser> findAll() {
		return authenticatedUserRepository.findAll();
	}
	
	@Override
	public Page<AuthenticatedUser> findAll(Pageable pageable) {
		return authenticatedUserRepository.findAll(pageable);
	}

	@Override
	public AuthenticatedUser findOneById(Long id) {
		return authenticatedUserRepository.findById(id).orElse(null);
	}
	
	public AuthenticatedUser findOneByEmail(String email) throws ExistentFieldValueException {
		AuthenticatedUser user = authenticatedUserRepository.findOneByEmail(email);
		if(user==null) {
			throw new ExistentFieldValueException("User", "email");
		}
		return user;
	}

	public AuthenticatedUser create(AuthenticatedUser entity) throws Exception {
		//enkripcija lozinke
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		entity.setPassword(encoder.encode(entity.getPassword()));
		//mora provera nad celom user tabelom da bi mail bio jedinstven
		// posto je nad celom tabelom -> moze se desiti da je Admin
		User userToCreate = (User) userRepository.findOneByEmail(entity.getEmail());
		if(userToCreate == null) {
			AuthenticatedUser saved = authenticatedUserRepository.save(entity);
			return saved;
		} else {
			if (userToCreate instanceof Admin) {
				throw new ExistentFieldValueException("User", "email");
			}
			AuthenticatedUser authenticatedUserToCreate = (AuthenticatedUser) userToCreate;
			if (authenticatedUserToCreate.isActivated()) {
				throw new ExistentFieldValueException("User", "email");
			} else {
				//postoji u bazi ali je neaktivan jer nije pratio link
				VerificationToken token = verificationTokenRepository.findByUser(authenticatedUserToCreate);
				if (token.isExpired()) {
					//istekao je moze da se registruje ponovo
					verificationTokenRepository.delete(token);
					return authenticatedUserToCreate;
				} else {
					throw new Exception("Please check your email for the verification link!");
				}

			}
		}

	}
	
	@Async
    @Transactional
    public void confirmRegistration(AuthenticatedUser user) throws MessagingException {
        String token = UUID.randomUUID().toString();
        this.createVerificationToken(user, token);

        String recipientAddress = user.getEmail();
        String subject = "Registration Confirmation";
        String confirmationUrl
                = "https://localhost:8080" + "/api/registrationConfirm?token=" + token;

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
                "<p style=\"outline:none;margin:0;padding:0\">Follow the link to complete your registration: " + confirmationUrl +"</p>\n" +
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

	@Override
	public void delete(Long id) throws Exception {
		AuthenticatedUser authenticatedUserToDelete = authenticatedUserRepository.findById(id).orElse(null);
		if(authenticatedUserToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		authenticatedUserRepository.delete(authenticatedUserToDelete);
	}

	public AuthenticatedUser updatePersonalInformation(UserUpdateDTO entity,AuthenticatedUser user) throws Exception {
		//AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AuthenticatedUser authenticatedUserToUpdate = findOneById(user.getId());
		authenticatedUserToUpdate.setName(entity.getName());
		authenticatedUserToUpdate.setSurname(entity.getSurname());
		return authenticatedUserRepository.save(authenticatedUserToUpdate);
	}

	public AuthenticatedUser updatePassword (PasswordDTO passwordDTO, AuthenticatedUser user) throws Exception {
		//AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		AuthenticatedUser authenticatedUserToUpdate = authenticatedUserRepository.findById(user.getId()).orElse(null);
		if(authenticatedUserToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}

		//enkodovanje sifre
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if(!encoder.matches(passwordDTO.getOldPassword(), authenticatedUserToUpdate.getPassword())) {
			throw new Exception("Old password is incorrect.");
		}

		if(passwordDTO.getOldPassword().equals(passwordDTO.getNewPassword())) {
			throw new Exception("New password can not be same as old password.");
		}

		if(!passwordDTO.getNewPassword().equals(passwordDTO.getRepeatedPassword())) {
			throw new Exception("New password and repeated password don`t match.");
		}

		authenticatedUserToUpdate.setPassword(encoder.encode(passwordDTO.getNewPassword()));
		return authenticatedUserRepository.save(authenticatedUserToUpdate);
	}

	//nigde se ne koristi -> nije testirano
	public AuthenticatedUser getUserByToken(String verificationToken) {
		AuthenticatedUser user = verificationTokenRepository.findByToken(verificationToken).getUser();
		return user;
	}

	public VerificationToken getVerificationToken(String VerificationToken) {
		return verificationTokenRepository.findByToken(VerificationToken);
	}

	public AuthenticatedUser saveRegisteredUser(AuthenticatedUser user) {
		return authenticatedUserRepository.save(user);
	}

	public VerificationToken createVerificationToken(AuthenticatedUser user, String token) {
		VerificationToken myToken = new VerificationToken(token, user);
		return verificationTokenRepository.save(myToken);
	}

	@Transactional
	public void addSubscribedSite(Long culturalSiteId, AuthenticatedUser loggedIn) throws NonexistentIdException, ConflictException {
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if(culturalSite == null) {
			throw new NonexistentIdException(culturalSiteService.getType());
		}
		//AuthenticatedUser loggedIn = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AuthenticatedUser user = findOneById(loggedIn.getId());
		Set<CulturalSite> allSubscribed = user.getSubscribedSites();
		if(allSubscribed.contains(culturalSite)) {
			throw new ConflictException("User is already subscribed.");
		}
		user.addSubscribedSite(culturalSite);
		authenticatedUserRepository.save(user);
	}

	@Transactional
	public void removeSubscribedSite(Long culturalSiteId, AuthenticatedUser loggedIn) throws NonexistentIdException, ConflictException {
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if(culturalSite == null) {
			throw new NonexistentIdException(culturalSiteService.getType());
		}
		//AuthenticatedUser loggedIn = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AuthenticatedUser user = findOneById(loggedIn.getId());
		Set<CulturalSite> allSubscribed = user.getSubscribedSites();
		if(!allSubscribed.contains(culturalSite)) {
			throw new ConflictException("User is not subscribed to this cultural site.");
		}
		user.removeSubscribedSite(culturalSite);
		authenticatedUserRepository.save(user);
	}

	public AuthenticatedUser findCurrent() {
		return (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
