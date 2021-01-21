package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginRegisterPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;
import static org.junit.Assert.assertEquals;

public class LoginRegisterE2ETest {

    private WebDriver driver;

    private LoginRegisterPage loginRegisterPage;

    private HeaderPage headerPage;

    private HomepagePage homepagePage;

    @Before
    public void setUp() {
        //default-ni browser za selenium je firefox, pa ukoliko zelimo da koristimo chrome moramo da ubacimo
        //chrome ekstenziju i podesimo chrome kao default-ni driver
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();

        //prosirenje prozora za bolji pregled
        driver.manage().window().maximize();
        //instanciranje potrebnih page objekata
        loginRegisterPage = PageFactory.initElements(driver, LoginRegisterPage.class);
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
    }

    @Test
    public void redirectToLoginSuccess() throws InterruptedException {
        driver.get("https://localhost:4200/login-register/register");

        justWait();

        loginRegisterPage.getLoginLink().click();

        loginRegisterPage.ensureIsVisibleLoginForm();

        justWait();

        assertEquals("https://localhost:4200/login-register/login", driver.getCurrentUrl());
    }

    @Test
    public void redirectToRegisterSuccess() throws InterruptedException {
        driver.get("https://localhost:4200/login-register/login");

        justWait();

        loginRegisterPage.getRegisterLink().click();

        loginRegisterPage.ensureIsVisibleRegisterForm();

        justWait();

        assertEquals("https://localhost:4200/login-register/register", driver.getCurrentUrl());
    }

    @Test
    public void redirectToHomeSuccess() throws InterruptedException {
        driver.get("https://localhost:4200/login-register/login");

        justWait();

        headerPage.getHomeBtn().click();

        headerPage.ensureIsUnauthenticatedUser();

        homepagePage.ensureIsDisplayedHomepage();

        justWait();

        assertEquals("https://localhost:4200/homepage", driver.getCurrentUrl());
    }

    @After
    public void cleanUp() {
        driver.quit();
    }

    /*Omogucava cekanje da bi nam bile vidljivije promene tokom testa*/
    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(2000);
        }
    }
}
