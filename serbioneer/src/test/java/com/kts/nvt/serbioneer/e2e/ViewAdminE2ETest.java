package com.kts.nvt.serbioneer.e2e;

import com.kts.nvt.serbioneer.e2e.pages.HeaderPage;
import com.kts.nvt.serbioneer.e2e.pages.LoginPage;
import com.kts.nvt.serbioneer.e2e.pages.ViewAdminPage;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class ViewAdminE2ETest {

    private WebDriver driver;

    private JavascriptExecutor jsExecutor;

    private HeaderPage headerPage;

    private LoginPage loginPage;

    private ViewAdminPage viewAdminPage;

    @Before
    public void setUp() throws InterruptedException{
        System.setProperty("webdriver.chrome.driver", "src/test/resources/chromedriver.exe");
        ChromeOptions option= new ChromeOptions();
        option.addArguments("ignore-certificate-errors");
        driver = new ChromeDriver(option);

        jsExecutor = (JavascriptExecutor) driver;

        driver.manage().window().maximize();

        headerPage = PageFactory.initElements(driver, HeaderPage.class);
        loginPage = PageFactory.initElements(driver, LoginPage.class);
        viewAdminPage = PageFactory.initElements(driver, ViewAdminPage.class);

        driver.get("https://localhost:4200/login-register/login");
    }

    @Test
    public void AdminTableTest() throws InterruptedException{
        justWait();

        loginPage.getEmail().sendKeys("admin@admin.com");
        loginPage.getPassword().sendKeys("admin");
        loginPage.getViewPass().click();
        justWait();
        loginPage.getLoginBtn().click();

        justWait();
        headerPage.getViewAdminBtn().click();
        justWait();

        assertEquals("https://localhost:4200/admin/view-admin", driver.getCurrentUrl());

        viewAdminPage.ensureIsDisplayedAdmins();

        List<WebElement> rows = viewAdminPage.getAdminTable().findElements(By.tagName("td"));

        assertTrue(rows.size() > 0);

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
