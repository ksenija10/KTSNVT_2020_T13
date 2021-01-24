package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.ChangePasswordPage;
import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class ChangePasswordAuthenticatedUserE2ETest {

    private WebDriver driver;

    private HeaderPage headerPage;

    private ChangePasswordPage changePasswordPage;

    private HomepagePage homepagePage;

    private LoginPage loginPage;

    @Before
    public void setUp() throws InterruptedException {
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
        changePasswordPage = PageFactory.initElements(driver, ChangePasswordPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        //redirekcija na pocetak interakcije tj na log in page
        driver.get("https://localhost:4200/login-register/login");

        //logovanje
        justWait();

        loginPage.getEmail().sendKeys("prvi@user.com");

        loginPage.getPassword().sendKeys("user");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getChangePasswordBtn().click();
    }

    @Test
    public void changePassTestSuccess() throws InterruptedException {
        justWait();

        changePasswordPage.ensureIsDisplayedChangePasswordForm();

        headerPage.ensureIsAuthenticatedUser();

        changePasswordPage.getOldPassword().sendKeys("user");

        changePasswordPage.getNewPassword().sendKeys("new");

        changePasswordPage.getRepeatPassword().sendKeys("new");

        changePasswordPage.getViewPass().click();

        justWait();

        assertTrue(changePasswordPage.getChangePassBtn().isEnabled());

        changePasswordPage.getChangePassBtn().click();

        changePasswordPage.toastSuccess();

        homepagePage.ensureIsDisplayedHomepage();

        headerPage.ensureIsAuthenticatedUser();

        assertEquals("https://localhost:4200/homepage", driver.getCurrentUrl());

        justWait();

        //vracanje stare sifre

        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();
        headerPage.getChangePasswordBtn().click();

        justWait();

        changePasswordPage.getOldPassword().sendKeys("new");

        changePasswordPage.getNewPassword().sendKeys("user");

        changePasswordPage.getRepeatPassword().sendKeys("user");

        changePasswordPage.getViewPass().click();

        justWait();

        changePasswordPage.getChangePassBtn().click();

        justWait();
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
