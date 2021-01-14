package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
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

    @Before
    public void setUp() {
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        driver = new ChromeDriver();

        driver.manage().window().maximize();
        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);

        driver.get("http://localhost:4200/login-register/login");
    }

    @Test
    public void LogInTestSuccess() throws InterruptedException {
        justWait();

        headerPage.ensureIsUnauthenticatedUser();

        loginPage.ensureIsDisplayedLoginForm();

        loginPage.getEmail().sendKeys("admin@admin.com");

        loginPage.getPassword().sendKeys("admin");

        justWait();

        loginPage.getLoginBtn().click();

        justWait();

        assertEquals("http://localhost:4200/homepage", driver.getCurrentUrl());
    }

    @After
    public void cleanUp() {
        driver.quit();
    }

    private void justWait() throws InterruptedException {
        synchronized (driver)
        {
            driver.wait(2000);
        }
    }
}
