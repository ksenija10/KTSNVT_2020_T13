package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.RegisterPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
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
        driver = new ChromeDriver();

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        registerPage = PageFactory.initElements(driver, RegisterPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        //redirekcija na pocetak interakcije tj na register page
        driver.get("http://localhost:4200/login-register/register");
    }

    @Test
    public void RegisterSuccess() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("ksenija.prcic1998@gmail.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        justWait();

        loginPage.ensureIsDisplayedLoginForm();

        registerPage.toastSuccess();

        justWait();

        assertEquals("http://localhost:4200/login-register/login", driver.getCurrentUrl());

    }

    @Test
    public void RegisterEmailNotVerified() throws InterruptedException {
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

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        justWait();

        loginPage.ensureIsDisplayedLoginForm();

        registerPage.toastSuccess();

        justWait();

        assertEquals("http://localhost:4200/login-register/login", driver.getCurrentUrl());

        justWait();

        //Redirekcija na registraciju i ponovni pokusaj iste bez da je prihvacen confirmation email

        driver.get("http://localhost:4200/login-register/register");

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("ksenija.prcic1998@gmail.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        justWait();

        registerPage.ensureIsVisibleRegisterForm();

        registerPage.toastError("Please check your email for the verification link!");

        justWait();

        assertEquals("http://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    //STA SE DESI AKO SE REGISTRUJE I POKUSA DA SE ULOGUJE SA ISTIM TIM MEJLOM PRE NEGO STO GA ODOBRI

    @Test
    public void RegisterEmailAlreadyExists() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        registerPage.ensureIsVisibleRegisterForm();

        assertFalse(registerPage.getRegisterBtn().isEnabled());

        registerPage.getEmail().sendKeys("admin@admin.com");

        registerPage.getPassword().sendKeys("user");

        registerPage.getRepeatPassword().sendKeys("user");

        registerPage.getName().sendKeys("Ksenija");

        registerPage.getSurname().sendKeys("Prcic");

        assertTrue(registerPage.getRegisterBtn().isEnabled());

        justWait();

        registerPage.getRegisterBtn().click();

        justWait();

        registerPage.ensureIsVisibleRegisterForm();

        registerPage.toastError("User with given email already exists.");

        justWait();

        assertEquals("http://localhost:4200/login-register/register", driver.getCurrentUrl());
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
