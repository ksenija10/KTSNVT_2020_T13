package com.kts.nvt.serbioneer.e2e;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.HomepagePage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.LoginRegisterPage;

public class LogoutE2ETest {

	private WebDriver driver;

    private HeaderPage headerPage;

    private LoginPage loginPage;
  
    private HomepagePage homepagePage;
    
    private LoginRegisterPage loginRegisterPage;

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
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        homepagePage = PageFactory.initElements(driver, HomepagePage.class);
        loginRegisterPage = PageFactory.initElements(driver, LoginRegisterPage.class);

        //redirekcija na pocetak interakcije tj na login page
        driver.get("https://localhost:4200/login-register/login");
        
        justWait();

        loginPage.getEmail().sendKeys("admin@admin.com");

        loginPage.getPassword().sendKeys("admin");

        loginPage.getViewPass().click();

        justWait();

        loginPage.getLoginBtn().click();
    }
    
    @Test
    public void logoutSuccess() throws InterruptedException {
        justWait();

        homepagePage.ensureIsDisplayedHomepage();

        headerPage.ensureIsAdmin();
        
        justWait();

        Actions a= new Actions(driver);
        a.moveToElement(headerPage.getUserDropDown()).build().perform();

        justWait();

        headerPage.getLogoutBtn().click();
        headerPage.ensureIsUnauthenticatedUser();
        loginPage.ensureIsDisplayedLoginForm();
        loginRegisterPage.toastSuccessLogout();
        assertEquals(driver.getCurrentUrl(), "https://localhost:4200/login-register/login");

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
