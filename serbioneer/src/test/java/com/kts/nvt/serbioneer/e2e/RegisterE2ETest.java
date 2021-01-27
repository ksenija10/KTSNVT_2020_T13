package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.RegisterPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.PageFactory;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

public class RegisterE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private RegisterPage registerPage;

    private LoginPage loginPage;

    @Before
    public void setUp() {
        //default-ni browser za selenium je firefox, pa ukoliko zelimo da koristimo chrome moramo da ubacimo
        //chrome ekstenziju i podesimo chrome kao default-ni driver
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        ChromeOptions option= new ChromeOptions();
        option.addArguments("ignore-certificate-errors");
        driver = new ChromeDriver(option);

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        registerPage = PageFactory.initElements(driver, RegisterPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        //redirekcija na pocetak interakcije tj na register page
        driver.get("https://localhost:4200/login-register/register");
    }

    @Test
    public void RegisterTestSuccess() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("serbioneer@gmail.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Dolanov");

        registerPage.getSurname().sendKeys("Katarina");

        registerPage.getViewPass().click();

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        justWait();

        loginPage.ensureIsDisplayedLoginForm();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.toastSuccess();

        justWait();

        assertEquals("https://localhost:4200/login-register/login", driver.getCurrentUrl());

    }

    @Test
    public void RegisterTestEmailNotVerified() throws InterruptedException {
        //Uspesna registracija
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("ksenija.prcic1998@gmail.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        loginPage.ensureIsDisplayedLoginForm();

        registerPage.toastSuccess();

        justWait();

        assertEquals("https://localhost:4200/login-register/login", driver.getCurrentUrl());

        justWait();

        //Redirekcija na registraciju i ponovni pokusaj iste bez da je prihvacen confirmation email

        driver.get("https://localhost:4200/login-register/register");

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("ksenija.prcic1998@gmail.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.toastError("Please check your email for the verification link!");

        justWait();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestEmailAlreadyExists() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.toastError("User with given email already exists.");

        justWait();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestInvalidEmailFormat() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("invalidEmailFormat");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getEmailError().getText(),"Not a valid email");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestEmptyEmail() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getEmailError().getText(),"Required field");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestEmptyPassword() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getPasswordError().getText(),"Required field");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestEmptyRepeatPassword() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getRepeatPasswordError().getText(),"Required field");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestPasswordsDontMatch() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("admin");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getPasswordsDontMatchError().getText(),"Passwords must match");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestEmptyName() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("admin");

        registerPage.getRepeatPassword().sendKeys("admin");

        registerPage.getName().sendKeys("");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getNameError().getText(),"Required field");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestInvalidName() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("admin");

        registerPage.getRepeatPassword().sendKeys("admin");

        registerPage.getName().sendKeys("K3%");

        registerPage.getSurname().sendKeys("Prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getNameError().getText(),"Cannot contain special characters or numbers");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestEmptySurname() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("admin");

        registerPage.getRepeatPassword().sendKeys("admin");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getSurnameError().getText(),"Required field");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestInvalidSurname() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("admin");

        registerPage.getRepeatPassword().sendKeys("admin");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("prcic");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getSurnameError().getText(),"Must start with capital letter");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void RegisterTestEmptyAllFields() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("");

        registerPage.getPassword().sendKeys("");

        registerPage.getRepeatPassword().sendKeys("");

        registerPage.getName().sendKeys("");

        registerPage.getSurname().sendKeys("");

        registerPage.getViewPass().click();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        justWait();

        assertEquals(registerPage.getEmailError().getText(),"Required field");
        assertEquals(registerPage.getPasswordError().getText(),"Required field");
        assertEquals(registerPage.getRepeatPasswordError().getText(),"Required field");
        assertEquals(registerPage.getNameError().getText(),"Required field");
        assertEquals(registerPage.getSurnameError().getText(),"Required field");

        registerPage.ensureIsVisibleRegisterForm();

        headerPage.ensureIsUnauthenticatedUser();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @After
    public void cleanUp() {
        driver.quit();
    }

    /*Omogucava cekanje da bi nam bile vidljivije promene tokom testa*/
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(3500);
        }
    }
}
