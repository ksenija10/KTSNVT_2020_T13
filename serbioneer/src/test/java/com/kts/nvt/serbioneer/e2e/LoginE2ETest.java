package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import org.junit.After;
import org.junit.Before;
import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.PageFactory;

public class LoginE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private LoginPage loginPage;

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
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);

        //redirekcija na pocetak interakcije tj na login page
        driver.get("http://localhost:4200/login-register/login");
    }

    @Test
    public void LogInTestAdminSuccess() throws InterruptedException {

        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        loginPage.ensureIsDisplayedLoginForm();

        loginPage.getEmail().sendKeys("admin@admin.com");

        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        headerPage.ensureIsAdmin();

        loginPage.toastSuccess();

        assertEquals("http://localhost:4200/homepage", driver.getCurrentUrl());
    }

    @Test
    public void LogInTestAuthenticatedUserSuccess() throws InterruptedException {

        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        loginPage.ensureIsDisplayedLoginForm();

        loginPage.getEmail().sendKeys("prvi@user.com");

        loginPage.getPassword().sendKeys("user");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        headerPage.ensureIsAuthenticatedUser();

        loginPage.toastSuccess();

        assertEquals("http://localhost:4200/homepage", driver.getCurrentUrl());
    }

    @Test
    public void LogInTestInvalidEmail() throws InterruptedException {

        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        loginPage.ensureIsDisplayedLoginForm();

        loginPage.getEmail().sendKeys("greska@email.com");

        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        loginPage.ensureIsDisplayedLoginForm();

        loginPage.toastError();

        assertEquals("http://localhost:4200/login-register/login", driver.getCurrentUrl());
    }

    @Test
    public void LogInTestInvalidPassword() throws InterruptedException {

        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        loginPage.ensureIsDisplayedLoginForm();

        loginPage.getEmail().sendKeys("greska@email.com");

        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        loginPage.ensureIsDisplayedLoginForm();

        loginPage.toastError();

        assertEquals("http://localhost:4200/login-register/login", driver.getCurrentUrl());
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
